//
//  AppDelegate.swift
//  JokeGenerator
//
//  Created by Viktoriya on 13.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var appDelegate: AppDelegate {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Coldn't open AppDelegate")
        }
        return appDelegate
    }

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setInitialViewController()
        return true
    }

    // MARK: - Set Initial View Controller
        private func setInitialViewController() {
            let controller = StartViewController.create()
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
        }
}

