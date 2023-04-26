//
//  HomeInteractor.swift
//  Super easy dev
//
//  Created by Олег Борисов on 24.03.2023
//

protocol HomeInteractorProtocol: AnyObject {
}

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol?
}
