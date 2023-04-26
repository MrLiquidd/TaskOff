//
//  SettingsInteractor.swift
//  Super easy dev
//
//  Created by Олег Борисов on 26.03.2023
//

protocol SettingsInteractorProtocol: AnyObject {
}

class SettingsInteractor: SettingsInteractorProtocol {
    weak var presenter: SettingsPresenterProtocol?
}
