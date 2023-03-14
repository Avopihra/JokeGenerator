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
            fatalError("not open appdelegate")
        }
        return appDelegate
    }

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = UIViewController(nibName: "MainViewController", bundle: nil)
        
        showRootController(vc)
        return true
    }
    
    private func showRootController(_ controller: UIViewController) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        AppDelegate.appDelegate.window = window
        window.makeKeyAndVisible()
        window.rootViewController = controller
    }
}

