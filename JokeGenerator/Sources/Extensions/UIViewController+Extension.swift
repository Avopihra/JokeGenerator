//
//  UIViewController+Extension.swift
//  JokeGenerator
//
//  Created by Viktoriya on 15.03.2023.
//

import UIKit

extension UIViewController {
    
    static func create() -> UIViewController {
        let window = UIWindow(frame: UIScreen.main.bounds)
        AppDelegate.appDelegate.window = window
        let viewController = UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController() ?? UIViewController()
        return viewController
    }
}
