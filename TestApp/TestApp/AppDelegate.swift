//
//  AppDelegate.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 16/08/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let navigationController = UINavigationController()
            navigationController.viewControllers = [MainViewController(viewModel: MainViewModel())]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            navigationController.setupNavigationController()
        }
        return true
    }
}
