//
//  TaskEditorDataSource.swift
//  TaskOff
//
//  Created by Олег Борисов on 31.03.2023.
//

import UIKit

protocol TaskEditorDataSourceDelegate: AnyObject{

}

class TaskEditorDataSource: NSObject{

    private weak var delegate: TaskEditorDataSourceDelegate?

    private var visibleSections: [EditTaskEditorSectionProtocol] = []

    lazy var initialSections: [EditTaskEditorSectionProtocol] = {
        let mainTaskSection = MainTaskSection()
        let dateTaskSection = DateTaskSection()
        let fileTaskSection = FileTaskSection()

        return [mainTaskSection, dateTaskSection, fileTaskSection]
    }()

    override init() {
        super.init()
        self.visibleSections = initialSections
    }
}


//MARK: - UITableViewDataSource
extension TaskEditorDataSource: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleSections[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = visibleSections[indexPath.section]
        let cell = section.cells[indexPath.row]
        let actualCell = cell.getCellBy(tableView, cellForRowAt: indexPath)
        actualCell.selectionStyle = .none
        return actualCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        visibleSections.count
    }

}


//MARK: - UITableViewDelegate
extension TaskEditorDataSource: UITableViewDelegate{

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let section = visibleSections[indexPath.section]
        let sectionCell = section.cells[indexPath.row]
        sectionCell.willDisplay(cell, forRowAt: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = visibleSections[indexPath.section]
        let cell = section.cells[indexPath.row]
        return cell.height
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = visibleSections[indexPath.section]
        let cell = section.cells[indexPath.row]
        cell.didSelect(tableView, didSelectRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = visibleSections[section]
        return section.title
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
