//
//  AuthModuleBuilder.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//

import UIKit

class AuthModuleBuilder {
    static func build() -> AuthViewController {
        let firebaseManager = FirebaseService()

        let interactor = AuthInteractor(firebaseManager: firebaseManager)
        let presenter = AuthPresenter(interactor: interactor)
        let viewController = AuthViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}
