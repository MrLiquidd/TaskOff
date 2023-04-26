//
//  AuthPresenter.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//


class AuthPresenter {
    weak var view: AuthViewProtocolInput?
    var interactor: AuthInteractorProtocolInput

    init(interactor: AuthInteractorProtocolInput) {
        self.interactor = interactor
    }
}

extension AuthPresenter: AuthViewProtocolOutput{

    func authEmailTapped(emailLabel: String, passwordLabel: String) {
        interactor.authEmailTapped(emailLabel: emailLabel, passwordLabel: passwordLabel)
    }

}

extension AuthPresenter: AuthInteractorProtocolOutput{
    func authSuccessful() {
        view?.authSuccessful()
    }
}
