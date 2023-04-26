//
//  TaskEditorInteractor.swift
//  Super easy dev
//
//  Created by Олег Борисов on 31.03.2023
//

protocol TaskEditorInteractorProtocol: AnyObject {
}

class TaskEditorInteractor: TaskEditorInteractorProtocol {
    weak var presenter: TaskEditorPresenterProtocol?
}
