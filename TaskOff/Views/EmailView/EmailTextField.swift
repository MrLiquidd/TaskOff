//
//  EmailTextField.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

protocol EmailTextFieldDelegate: AnyObject{
    func editingChanged(_ sender: EmailTextField)
    func editingDidEnd(_ sender: EmailTextField)
}

class EmailTextField: UIView{
    var reloadTableView: (() -> Void)?

    //MARK: - Public
    typealias CustomValidation = (_ textValue: String?) -> (Bool, String)?

    let mailImageView = UIImageView(image: UIImage(systemName: "envelope.fill"))
    let textField = UITextField()
    let dividerView = UIView()
    let errorLabel = UILabel()

    let placeHolderText: String
    var customValidation: CustomValidation?
    weak var delegate: EmailTextFieldDelegate?

    var text: String? {
        get { return textField.text }
        set { textField.text = newValue }
    }

    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        super.init(frame: .zero)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 60)
    }
}

//MARK: - Private
private extension EmailTextField{
    func style(){
        translatesAutoresizingMaskIntoConstraints = false

        mailImageView.translatesAutoresizingMaskIntoConstraints = false

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeHolderText
        textField.delegate = self
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string:placeHolderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])

        // extra interaction
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)

        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .systemRed
        errorLabel.font = .preferredFont(forTextStyle: .footnote)
        errorLabel.text = "Your eamil must meet the requirements below"
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.isHidden = true

        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator

    }

    func layout(){
        addSubview(mailImageView)
        addSubview(textField)
        addSubview(dividerView)
        addSubview(errorLabel)

        // lock
        NSLayoutConstraint.activate([
            mailImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            mailImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        // textfield
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: mailImageView.trailingAnchor, multiplier: 1)
        ])

        // divider
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1)
        ])

        // error
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        // CHCR
        mailImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }
}

// MARK: - Actions
extension EmailTextField{
    @objc func textFieldEditingChanged(_ sender: UITextField){
        delegate?.editingChanged(self)
    }
}

// MARK: - UITextFieldDelegate
extension EmailTextField: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.editingDidEnd(self)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

// MARK: - Validation
extension EmailTextField{
    func validate() -> Bool {
        EmailCriteria.isValidEmail(textField.text!)
    }

    private func showError(_ errorMessage: String) {
        errorLabel.isHidden = false
        errorLabel.text = errorMessage
    }

    private func clearError() {
        errorLabel.isHidden = true
        errorLabel.text = ""
    }
}
