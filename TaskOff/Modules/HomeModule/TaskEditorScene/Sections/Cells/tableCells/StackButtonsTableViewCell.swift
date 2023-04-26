//
//  StackButtonsTableViewCell.swift
//  TaskOff
//
//  Created by Олег Борисов on 13.04.2023.
//

import UIKit

class StackButtonsTableViewCell: UITableViewCell{

    var stackView = UIStackView()

    var buttons: [UIButton] {
        return []
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        stretch(stackView, top: 5, right: 5, left: 5, bottom: 5)
        buttons.forEach({
            stackView.addArrangedSubview($0)
        })
    }
}
