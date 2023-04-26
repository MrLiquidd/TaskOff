//
//  FileTaskSection.swift
//  TaskOff
//
//  Created by Олег Борисов on 12.04.2023.
//

import Foundation

class FileTaskSection: EditTaskEditorSection{
    override init() {
        super.init()
        let addBtnCell: AddButtonTask = AddButtonTask(with: "")
        cells = [addBtnCell]
    }
}
