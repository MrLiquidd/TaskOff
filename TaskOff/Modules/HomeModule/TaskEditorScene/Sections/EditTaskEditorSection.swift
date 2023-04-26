//
//  EditTaskEditorSection.swift
//  TaskOff
//
//  Created by Олег Борисов on 31.03.2023.
//

import UIKit

protocol EditTaskEditorSectionProtocol{
    var cells: [AnyTaskFieldProtocol]{get set}
    var title: String { get set }
}

class EditTaskEditorSection: EditTaskEditorSectionProtocol{
    var cells: [AnyTaskFieldProtocol] = []
    var title: String = ""
}
