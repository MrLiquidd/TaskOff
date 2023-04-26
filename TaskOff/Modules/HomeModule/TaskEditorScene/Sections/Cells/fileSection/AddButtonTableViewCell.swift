//
//  AddButtonTableViewCell.swift
//  TaskOff
//
//  Created by Олег Борисов on 14.04.2023.
//

import UIKit

class AddButtonTableViewCell: StackButtonsTableViewCell{
    let addButton = IconTextButton()

    override var buttons: [UIButton] {[
        addButton
    ]}

    public func configure(addBtnViewModel: IconTextButtonViewModel){

        addButton.configure(with: addBtnViewModel)
        addButton.addTarget(self, action: #selector(addBtnAction), for: .touchUpInside)
    }

    @objc func addBtnAction(_ sender: UIAction){
        print("actionBtnAction")
    }
}
