//
//  SignInModuleBuilder.swift
//  Super easy dev
//
//  Created by Олег Борисов on 23.03.2023
//

import UIKit

class SignInModuleBuilder {
    static func build() -> SignInViewController {
        let firebaseManager = FirebaseService()
        let interactor = SignInInteractor(firebaseManager: firebaseManager)
        let presenter = SignInPresenter(interactor: interactor)
        let viewController = SignInViewController()
        presenter.view = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}
