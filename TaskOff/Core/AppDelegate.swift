//
//  AppDelegate.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var keyWindow:UIWindow?{
        return UIApplication.shared.connectedScenes.flatMap {
            ($0 as? UIWindowScene)?.windows ?? []
        }.first { $0.isKeyWindow }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func topMostController() -> UIViewController {
        guard var topController: UIViewController = keyWindow?.rootViewController else {
            fatalError("rootViewController is not initiated")
        }
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }


}

