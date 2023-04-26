//
//  DateTaskSection.swift
//  TaskOff
//
//  Created by Олег Борисов on 12.04.2023.
//

import Foundation

class DateTaskSection: EditTaskEditorSection{
    override init() {
        super.init()
        let dateCell: DateTask = DateTask(with: Date())
        let typeCell: TypeButtonTask = TypeButtonTask(with: "")
        cells = [dateCell ,typeCell]
    }
}
