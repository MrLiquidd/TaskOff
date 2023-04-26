//
//  ModuleFactory.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import Foundation


class ModuleFactory{
    func createPreviewModule() -> PreviewViewController{
        PreviewViewController()
    }

    func createAuthModule() -> AuthViewController{
        AuthModuleBuilder.build()
    }
    func createSignInModule() -> SignInViewController{
        SignInModuleBuilder.build()
    }
}
