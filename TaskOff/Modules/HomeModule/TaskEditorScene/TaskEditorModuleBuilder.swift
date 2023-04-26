//
//  TaskEditorModuleBuilder.swift
//  Super easy dev
//
//  Created by Олег Борисов on 31.03.2023
//

import UIKit

class TaskEditorModuleBuilder {
    static func build() -> TaskEditorViewController {
        let interactor = TaskEditorInteractor()
        let router = TaskEditorRouter()
        let presenter = TaskEditorPresenter(interactor: interactor, router: router)
        let viewController = TaskEditorViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
