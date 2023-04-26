//
//  AuthProtocols.swift
//  TaskOff
//
//  Created by Олег Борисов on 27.03.2023.
//

import Foundation

//View
protocol AuthViewProtocolInput: AnyObject {
    func authSuccessful()
}

protocol AuthViewProtocolOutput: AnyObject {
    func authEmailTapped(emailLabel: String, passwordLabel: String)

}

//Interactor
protocol AuthInteractorProtocolInput: AnyObject {
    func authEmailTapped(emailLabel: String, passwordLabel: String)

}
protocol AuthInteractorProtocolOutput: AnyObject {
    func authSuccessful()
}

