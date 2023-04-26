//
//  AuthCoordinator.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

class AuthCoordinator: Coordinator{
    var navigationController: UINavigationController
    var flowCompletionModule: CoordinatorHandler?

    private let moduleFactory = ModuleFactory()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showAuthModule()
    }

    func showAuthModule(){
        let vc = moduleFactory.createAuthModule()

        vc.completionHandler = { [weak self] value in
            switch value{
                case AuthCompletion.signIn.hashValue:
                    self?.showLoginModule()
                case AuthCompletion.login.hashValue:
                    self?.flowCompletionModule?()
                default:
                    return
            }
        }
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .overCurrentContext
        navigationController.pushViewController(vc, animated: true)
    }

    func showLoginModule(){
        let vc = moduleFactory.createSignInModule()
        vc.completionHandler = { [weak self] value in
            self?.flowCompletionModule?()
        }

        navigationController.pushViewController(vc, animated: true)
    }
}
