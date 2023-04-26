//
//  TaskEditorTableViewCell.swift
//  TaskOff
//
//  Created by Олег Борисов on 02.04.2023.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    let textField: UITextField = {
        var textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGroupedBackground
        textField.font = .systemFont(ofSize: 20, weight: .medium)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing

        return textField
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        stretch(textField, top: 5, right: 5, left: 5)
    }

    public func configure(title: String, tintColor: UIColor){
        textField.tintColor = tintColor
        textField.placeholder = title
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
}
