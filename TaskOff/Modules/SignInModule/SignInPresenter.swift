//
//  SignInPresenter.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//

import Foundation

class SignInPresenter {
    weak var view: SignInViewProtocolInput?
    var interactor: SignInInteractorProtocolInput

    init(interactor: SignInInteractorProtocolInput) {
        self.interactor = interactor
    }
}

extension SignInPresenter: SignInViewProtocolOutput {
    func signInEmailTapped(emailLabel: String, passwordLabel: String, nickName: String) {
        interactor.signInEmailTapped(emailLabel: emailLabel, passwordLabel: passwordLabel, nickName: nickName)
    }


}
extension SignInPresenter: SignInInteractorProtocolOutput{
    func signInSuccessful() {
        view?.signInSuccessful()
    }
}
