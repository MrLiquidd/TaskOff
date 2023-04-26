//
//  FlowController.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import Foundation

protocol FlowController{
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}
