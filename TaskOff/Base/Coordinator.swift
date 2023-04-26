//
//  Coordinator.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit

typealias CoordinatorHandler = () -> ()

protocol Coordinator: AnyObject{
    var navigationController: UINavigationController { get set}
    var flowCompletionModule: CoordinatorHandler? { get set }

    func start()
}
