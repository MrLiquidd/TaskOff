//
//  MainTaskSection.swift
//  TaskOff
//
//  Created by Олег Борисов on 02.04.2023.
//

import Foundation

class MainTaskSection: EditTaskEditorSection{
    override init() {
        super.init()
        let titleCell: TitleTaskField = TitleTaskField(with: "Задача")
        let descriptionCell: DescriptionTaskField = DescriptionTaskField(with: "Описание")
        cells = [titleCell, descriptionCell]
    }
}
