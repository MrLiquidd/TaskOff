//
//  TextViewTableViewCell.swift
//  TaskOff
//
//  Created by Олег Борисов on 14.04.2023.
//

import UIKit

class TextViewTableViewCell: UITableViewCell{
    
    let textView: UITextView = {
        var textView = UITextView()
        textView.textColor = UIColor.lightGray
        textView.becomeFirstResponder()
        textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        textView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .systemGroupedBackground
        textView.font = .systemFont(ofSize: 18, weight: .medium)
        textView.placeholder = "Discription"

        return textView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        stretch(textView, top: 5, right: 5, left: 5)
    }

    public func configure(title: String, tintColor: UIColor){
        textView.tintColor = tintColor
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.resignFirstResponder()
    }
}
