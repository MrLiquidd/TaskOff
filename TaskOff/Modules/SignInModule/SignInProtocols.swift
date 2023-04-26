//
//  SignInProtocols.swift
//  TaskOff
//
//  Created by Олег Борисов on 07.04.2023.
//

import Foundation

//View
protocol SignInViewProtocolInput: AnyObject {
    func signInSuccessful()
}

protocol SignInViewProtocolOutput: AnyObject {
    func signInEmailTapped(emailLabel: String, passwordLabel: String, nickName: String)

}

//Interactor
protocol SignInInteractorProtocolInput: AnyObject {
    func signInEmailTapped(emailLabel: String, passwordLabel: String, nickName: String)

}
protocol SignInInteractorProtocolOutput: AnyObject {
    func signInSuccessful()
}

