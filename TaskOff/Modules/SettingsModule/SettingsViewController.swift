//
//  SettingsViewController.swift
//  Super easy dev
//
//  Created by Олег Борисов on 26.03.2023
//

import UIKit

protocol SettingsViewProtocol: AnyObject {
}

class SettingsViewController: UIViewController {
    // MARK: - Public
    var presenter: SettingsPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension SettingsViewController {
    func initialize() {
        view.backgroundColor = .cyan
        title = "Settings"
    }
}

// MARK: - SettingsViewProtocol
extension SettingsViewController: SettingsViewProtocol {
}
