//
//  SettingsPresenter.swift
//  Super easy dev
//
//  Created by Олег Борисов on 26.03.2023
//

protocol SettingsPresenterProtocol: AnyObject {
}

class SettingsPresenter {
    weak var view: SettingsViewProtocol?
    var router: SettingsRouterProtocol
    var interactor: SettingsInteractorProtocol

    init(interactor: SettingsInteractorProtocol, router: SettingsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension SettingsPresenter: SettingsPresenterProtocol {
}
