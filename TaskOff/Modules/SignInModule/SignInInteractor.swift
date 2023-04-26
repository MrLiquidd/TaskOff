//
//  SignInInteractor.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//


class SignInInteractor: SignInInteractorProtocolInput {
    var firebaseManager: FirebaseService

    init(firebaseManager: FirebaseService) {
        self.firebaseManager = firebaseManager
    }
    
    func signInEmailTapped(emailLabel: String, passwordLabel: String, nickName: String) {
        firebaseManager.signInUser(emailLabel: emailLabel, passwordLabel: passwordLabel, nickName: nickName) { result in
            switch result {
                case .success():
                    self.presenter?.signInSuccessful()
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    weak var presenter: SignInInteractorProtocolOutput?
}
