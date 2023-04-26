//
//  CoordinatorFactory.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

class CoordinatorFactory{
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator{
        AppCoordinator(navigationController: navigationController)
    }

    func createTabBarCoordinator(navigationController: UINavigationController) -> TabBarCoordinator{
        TabBarCoordinator(navigationController: navigationController)
    }

    func previewCoordinator(navigationController: UINavigationController) -> PreviewCoordinator{
        PreviewCoordinator(navigationController: navigationController)
    }

    func createAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator{
        AuthCoordinator(navigationController: navigationController)
    }
}
