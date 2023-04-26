//
//  PasswordStatusView.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

class PasswordStatusView: UIView{

    let stackView = UIStackView()
    let criteriaLabel = UILabel()

    let lengthCriteriaView = PasswordCriterialView(text: "8-32 characters (no spases)")
    let uppercaseCriteriaView = PasswordCriterialView(text: "uppercase letter (A-Z)")
    let lowercaseCriteriaView = PasswordCriterialView(text: "lowercase letter (a-z)")
    let digitCriteriaView = PasswordCriterialView(text: "digit (0-9")
    let specialCharacterCriteriaView = PasswordCriterialView(text: "special character (e.g. !@#$%^)")

    // Used to determine if we reset criteria back to empty state (⚪️).
    var shouldResetCriteria: Bool = true

    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 200)
    }

}

extension PasswordStatusView{
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiarySystemFill

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalCentering

        criteriaLabel.numberOfLines = 0
        criteriaLabel.lineBreakMode = .byWordWrapping
        criteriaLabel.attributedText = makeCriteriaMessage()

        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false

    }

    func layout(){
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(criteriaLabel)
        stackView.addArrangedSubview(uppercaseCriteriaView)
        stackView.addArrangedSubview(lowercaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leftAnchor.constraint(equalToSystemSpacingAfter: leftAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
        ])
    }

    private func makeCriteriaMessage() -> NSAttributedString{
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel

        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        boldTextAttributes[.foregroundColor] = UIColor.label

        let attrText = NSMutableAttributedString(string: "Use at least ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "3 of these 4 ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "criteria when setting your password:", attributes: plainTextAttributes))

        return attrText
    }
}


//MARK: - Actions
extension PasswordStatusView{

    func updateDisplay(_ text: String) {
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)

        if shouldResetCriteria {
            lengthAndNoSpaceMet
            ? lengthCriteriaView.isCriteriaMet = true
            : lengthCriteriaView.reset()

            uppercaseMet
            ? uppercaseCriteriaView.isCriteriaMet = true
            : uppercaseCriteriaView.reset()

            lowercaseMet
            ? lowercaseCriteriaView.isCriteriaMet = true
            : lowercaseCriteriaView.reset()

            digitMet
            ? digitCriteriaView.isCriteriaMet = true
            : digitCriteriaView.reset()

            specialCharacterMet
            ? specialCharacterCriteriaView.isCriteriaMet = true
            : specialCharacterCriteriaView.reset()
        } else {
            lengthCriteriaView.isCriteriaMet = lengthAndNoSpaceMet
            uppercaseCriteriaView.isCriteriaMet = uppercaseMet
            lowercaseCriteriaView.isCriteriaMet = lowercaseMet
            digitCriteriaView.isCriteriaMet = digitMet
            specialCharacterCriteriaView.isCriteriaMet = specialCharacterMet
        }
    }

    func validate(_ text: String) -> Bool {
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)

        // Ready Player1
        // Check for 3 of 4 criteria here...
        let checkable = [uppercaseMet, lowercaseMet, digitMet, specialCharacterMet]
        let metCriteria = checkable.filter { $0 }
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        if lengthAndNoSpaceMet && metCriteria.count >= 3 {
            return true
        }


        return false
    }

    func reset() {
        lengthCriteriaView.reset()
        uppercaseCriteriaView.reset()
        lowercaseCriteriaView.reset()
        digitCriteriaView.reset()
        specialCharacterCriteriaView.reset()
    }
}

//MARK: - Tests
