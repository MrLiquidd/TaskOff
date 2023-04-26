//
//  SignInViewController.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//

import UIKit


class SignInViewController: UIViewController, FlowController {

    //MARK: - Public
    var presenter: SignInViewProtocolOutput?
    var completionHandler: ((Int?) -> ())?
    
    typealias CustomValidation = PasswordTextField.CustomValidation

    let stackView = UIStackView()
    let emailTextField = EmailTextField(placeHolderText: TextString.emailLabelString)
    let newPasswordTextField = PasswordTextField(placeHolderText: TextString.passwordLabelString)
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(placeHolderText: TextString.passwordLabelString)
    let resetButton = UIButton(type: .system)

    var alert: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        style()
        layout()
    }
}

extension SignInViewController {

    private func initialize() {
        setupNewPassword()
        setupConfirmPassword()
        setupDismissKeyboardGesture()
        setupKeyboardHiding()
    }

    private func setupDismissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_: )))
        view.addGestureRecognizer(dismissKeyboardTap)
    }


    @objc func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true) // resign first responder
    }

    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func style() {
        view.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        statusView.layer.cornerRadius = 5
        statusView.clipsToBounds = true

        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle(TextString.signInButtonString, for: [])
        resetButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .primaryActionTriggered)

        stackView.addArrangedSubview(resetButton)
    }

    func layout() {

        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 5),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 5)

        ])
    }

    private func setupNewPassword() {
        let newPasswordValidation: CustomValidation = { text in

            // Empty text
            guard let text = text, !text.isEmpty else {
                self.statusView.reset()
                return (false, TextString.passwordLabelString)
            }

            // Valid characters
            let validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,@:?!()$\\/#"
            let invalidSet = CharacterSet(charactersIn: validChars).inverted
            guard text.rangeOfCharacter(from: invalidSet) == nil else {
                self.statusView.reset()
                return (false, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
            }


            return (true, "")
        }

        newPasswordTextField.customValidation = newPasswordValidation
        newPasswordTextField.delegate = self
    }


    private func setupConfirmPassword() {
        let confirmPasswordValidation: CustomValidation = { text in
            guard let text = text, !text.isEmpty else {
                return (false, TextString.passwordLabelString)
            }

            guard text == self.newPasswordTextField.text else {
                return (false, "Passwords do not match.")
            }

            return (true, "")
        }

        confirmPasswordTextField.customValidation = confirmPasswordValidation
        confirmPasswordTextField.delegate = self
    }
}

// MARK: PasswordTextFieldDelegate
extension SignInViewController: PasswordTextFieldDelegate {

    func editingChanged(_ sender: PasswordTextField) {
        if sender === newPasswordTextField {
            statusView.updateDisplay(sender.textField.text ?? "")
        }
    }

    func editingDidEnd(_ sender: PasswordTextField) {
        if sender === newPasswordTextField {
            statusView.shouldResetCriteria = false
            _ = newPasswordTextField.validate()
        } else if sender === confirmPasswordTextField {
            _ = confirmPasswordTextField.validate()
        }
    }
}

// MARK: Keyboard
extension SignInViewController {
    @objc func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
//
//        print("foo - userInfo: \(userInfo)")
//        print("foo - keyboardFrame: \(keyboardFrame)")
//        print("foo - currentTextField: \(currentTextField)")


        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)

        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height

        // if textField bottom is below keyboard bottom - bump the frame up
        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newFrameY
        }
//
//        print("foo - currentTextFieldFrame: \(currentTextField.frame)")
//        print("foo - convertedTextFieldFrame: \(convertedTextFieldFrame)")
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

// MARK: - SignInViewProtocol
extension SignInViewController: SignInViewProtocolInput {
    func signInSuccessful() {
        completionHandler?(AuthCompletion.login.hashValue)
    }

}

// MARK: Actions
extension SignInViewController {

    @objc func resetPasswordButtonTapped(sender: UIButton) {
        view.endEditing(true)

        let isValidNewPassword = newPasswordTextField.validate()
        let isValidConfirmPassword = confirmPasswordTextField.validate()

        let isValidConfirmEmail = emailTextField.validate()

        if isValidNewPassword && isValidConfirmPassword && isValidConfirmEmail {
            presenter?.signInEmailTapped(emailLabel: emailTextField.text!, passwordLabel: newPasswordTextField.text!, nickName: "test")
        }
    }

}

// MARK: Tests
extension SignInViewController {
    var newPasswordText: String? {
        get { return newPasswordTextField.text }
        set { newPasswordTextField.text = newValue}
    }

    var confirmPasswordText: String? {
        get { return confirmPasswordTextField.text }
        set { confirmPasswordTextField.text = newValue}
    }
}

