//
//  PreviewCoordinator.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

class PreviewCoordinator: Coordinator{
    var navigationController: UINavigationController
    var flowCompletionModule: CoordinatorHandler?

    private let moduleFactory = ModuleFactory()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showPreviewModule()
    }

    func showPreviewModule(){
        let vc = moduleFactory.createPreviewModule()

        vc.completionHandler = { [weak self] value in
            self?.flowCompletionModule?()
        }
        navigationController.pushViewController(vc, animated: true)
    }
}
