//
//  HomePresenter.swift
//  Super easy dev
//
//  Created by Олег Борисов on 24.03.2023
//

protocol HomePresenterProtocol: AnyObject {
}

class HomePresenter {
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol
    var interactor: HomeInteractorProtocol

    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
}
