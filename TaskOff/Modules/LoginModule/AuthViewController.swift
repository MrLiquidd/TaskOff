//
//  AuthViewController.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//

import UIKit

enum AuthCompletion{
    case signIn
    case login
}

class AuthViewController: UIViewController, FlowController {

    // MARK: - Public
    var completionHandler: ((Int?) -> ())?
    var presenter: AuthViewProtocolOutput?

    let logoLabel = UILabel()
    let companyLabel = UILabel()
    let stackView = UIStackView()
    let stackViewFooter = UIStackView()
    lazy var emailTextField = EmailTextField(placeHolderText: TextString.emailLabelString)
    lazy var passwordTextField = PasswordTextField(placeHolderText: TextString.passwordLabelString)
    let loginButton = UIButton(type: .system)
    let forgetPasswordButton = UIButton(type: .system)
    let signInButton = UIButton(type: .system)


    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        style()
        layout()
    }
}

// MARK: - Private functions
private extension AuthViewController {
    func initialize() {
    }

    func style(){
        view.backgroundColor = .systemBackground

        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.textColor = .label
        logoLabel.font = .preferredFont(forTextStyle: .largeTitle)
        logoLabel.font = UIFont.systemFont(ofSize: 60, weight: .heavy, width: .standard)
        logoLabel.text = "TaskOff"

        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.textColor = .systemGray
        companyLabel.font = .preferredFont(forTextStyle: .footnote)
        companyLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular, width: .standard)
        companyLabel.text = "Studion"
        companyLabel.textAlignment = .center

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        loginButton.setTitle(TextString.loginButtonString, for: [])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordButton.configuration = .plain()
        forgetPasswordButton.setTitle(TextString.forgotPasswordString, for: [])
        forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)

        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.layer.borderColor = UIColor.systemGray3.cgColor
        signInButton.layer.borderWidth = 1
        signInButton.layer.cornerRadius = 4
        signInButton.tintColor = .black
        signInButton.backgroundColor = .systemBackground
        signInButton.setTitle(TextString.signInButtonString, for: [])
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        stackViewFooter.translatesAutoresizingMaskIntoConstraints = false
        stackViewFooter.axis = .vertical
        stackViewFooter.spacing = 20

    }

    func layout(){
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(forgetPasswordButton)

        stackViewFooter.addArrangedSubview(signInButton)
        stackViewFooter.addArrangedSubview(companyLabel)

        view.addSubview(logoLabel)
        view.addSubview(stackView)
        view.addSubview(stackViewFooter)

        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 5),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 5),
        ])

        NSLayoutConstraint.activate([
            stackViewFooter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            stackViewFooter.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 5),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackViewFooter.trailingAnchor, multiplier: 5),
        ])

    }

    func checkValid() -> Bool{
        if emailTextField.text != "" ||
            passwordTextField.text != "" ||
            emailTextField.text != nil ||
            passwordTextField.text != nil {
            print("\(emailTextField.validate()) email")
            print("\(passwordTextField.validate()) password")
            if emailTextField.validate(), passwordTextField.validate(){
                return true
            }
        }

        return false
    }
}


//MARK: - Keyboard
private extension AuthViewController{
    @objc func keyboardWillShow(sender: NSNotification){
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
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

//MARK: - Actions
extension AuthViewController{

    @objc func signInButtonTapped(sender: UIButton){
        view.endEditing(true)
        completionHandler?(AuthCompletion.signIn.hashValue)
    }

    @objc func loginButtonTapped(sender: UIButton){
        view.endEditing(true)
        //send to interactor
        if checkValid(){
            presenter?.authEmailTapped(emailLabel: emailTextField.text!, passwordLabel: passwordTextField.text!)
        }
    }

    @objc func forgetPasswordTapped(sender: UIButton){
        print("Not done")
    }
}

// MARK: - AuthViewProtocol
extension AuthViewController: AuthViewProtocolInput{

    func authSuccessful() {
        completionHandler?(AuthCompletion.login.hashValue)
    }

}
