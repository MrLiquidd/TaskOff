//
//  TaskEditorPresenter.swift
//  Super easy dev
//
//  Created by Олег Борисов on 31.03.2023
//

protocol TaskEditorPresenterProtocol: AnyObject {
}

class TaskEditorPresenter {
    weak var view: TaskEditorViewProtocol?
    var router: TaskEditorRouterProtocol
    var interactor: TaskEditorInteractorProtocol

    init(interactor: TaskEditorInteractorProtocol, router: TaskEditorRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension TaskEditorPresenter: TaskEditorPresenterProtocol {
}
