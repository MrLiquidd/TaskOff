//
//  AuthInteractor.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//



class AuthInteractor: AuthInteractorProtocolInput {
    weak var presenter: AuthInteractorProtocolOutput?

    var firebaseManager: FirebaseService

    init(firebaseManager: FirebaseService) {
        self.firebaseManager = firebaseManager
    }

    func authEmailTapped(emailLabel: String, passwordLabel: String) {
        firebaseManager.authUser(emailLabel: emailLabel, passwordLabel: passwordLabel) { result in
            switch result{
                case .success():
                    self.presenter?.authSuccessful()
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

}
