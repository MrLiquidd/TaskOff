//
//  TabBarCoordinator.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

enum TabBarPage{
    case settings
    case main

    init?(index: Int){
        switch index{
            case 0: self = .main
            case 1: self = .settings
            default : return nil
        }
    }

    func pageTitleValue() -> String{
        switch self{
            case .main: return "Main"
            case .settings: return "Settings"
        }
    }

    func pageOrderNumber() -> Int{
        switch self{
            case .main: return 0
            case .settings: return 1
        }
    }

    func pageImage() -> UIImage{
        switch self{
            case .main: return UIImage(systemName: "house")!
            case .settings: return UIImage(systemName: "person.fill")!
        }
    }
}

protocol TabBarCoordinatorProtocol: Coordinator{
    var tabBarController: UITabBarController { get set }
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex( _ index: Int)
    func currentPage() -> TabBarPage?
}

class TabBarCoordinator: NSObject, Coordinator{

    var navigationController: UINavigationController
    var flowCompletionModule: CoordinatorHandler?

    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        let pages: [TabBarPage] = [.settings, .main].sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber()})
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(withTabBarControllers: controllers)
    }

    private func prepareTabBarController(withTabBarControllers tabControllers: [UINavigationController]){
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .systemGroupedBackground
        tabBarController.tabBar.tintColor = .systemOrange
        navigationController.viewControllers = [tabBarController]
    }

    private func getTabController(_ page: TabBarPage) -> UINavigationController{
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(), image: page.pageImage(), tag: page.pageOrderNumber())

        switch page{
            case .main:
                let vc = HomeModuleBuilder.build()
                navController.pushViewController(vc, animated: true)
            case .settings:
                let vc = SettingsModuleBuilder.build()
                navController.pushViewController(vc, animated: true)
        }
        return navController
    }

    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex)}

    func selectPage(_ page: TabBarPage){
        tabBarController.selectedIndex = page.pageOrderNumber()
    }

    func setSelectedIndex(_ index: Int){
        guard let page = TabBarPage.init(index: index) else { return }
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}


extension TabBarCoordinator: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //Something
    }
}
