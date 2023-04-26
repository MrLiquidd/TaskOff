//
//  AppCoordinator.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator{
    func showAuthViewFlow()
    func showMainFlow()
}

class AppCoordinator: AppCoordinatorProtocol{
    var flowCompletionModule: CoordinatorHandler?
    var navigationController: UINavigationController

    private var childCoordinators: [Coordinator] = []

    var isAuth: Bool = false


    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showAuthViewFlow()
//        showMainFlow()
    }

    func showPreviewFlow(){
        let previewCoordinator = CoordinatorFactory().previewCoordinator(navigationController: navigationController)
        childCoordinators.append(previewCoordinator)
        previewCoordinator.flowCompletionModule = { [weak self] in
            self?.showAuthViewFlow()
        }
        previewCoordinator.start()
    }

    func showAuthViewFlow() {
        let authCoordinator = CoordinatorFactory().createAuthCoordinator(navigationController: navigationController)
        childCoordinators.append(authCoordinator)
        authCoordinator.flowCompletionModule = { [weak self] in
            self?.showMainFlow()
            self?.isAuth = true
        }
        authCoordinator.start()
    }

    func showMainFlow() {
        let tabBarCoordinator = CoordinatorFactory().createTabBarCoordinator(navigationController: navigationController)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
    }
}
