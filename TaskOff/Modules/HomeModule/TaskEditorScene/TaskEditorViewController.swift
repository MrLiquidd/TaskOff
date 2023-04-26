//
//  TaskEditorViewController.swift
//  Super easy dev
//
//  Created by Олег Борисов on 31.03.2023
//

import UIKit

protocol TaskEditorViewProtocol: AnyObject {
}

class TaskEditorViewController: UIViewController {

    private var dataSource = TaskEditorDataSource()

    // MARK: - Public
    var presenter: TaskEditorPresenterProtocol?

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        style()
        setConstraints()
    }
}

// MARK: - Private functions
private extension TaskEditorViewController {

    func initialize() {
        title = "Добавить задачу"

    }
    func style(){
        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        tableView.separatorStyle = .none

        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground

        tableView.register(TextFieldTableViewCell.self)
        tableView.register(TextViewTableViewCell.self)
        tableView.register(DateTableViewCell.self)
        tableView.register(DateButtonsTableViewCell.self)
        tableView.register(AddButtonTableViewCell.self)

    }
    func setConstraints(){
        view.addSubview(tableView)

    }

    internal override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK: - TaskEditorViewProtocol
extension TaskEditorViewController: TaskEditorViewProtocol {
}
