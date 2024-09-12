//
//  AppManager.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 06/09/2024.
//

import Foundation
import UIKit

struct AppManager {
    static func startApp(window: UIWindow?) {
        if let isOpendBefore = UserDefaultsManager.shared().isOpendBefore {
            if isOpendBefore {
                if let isLoggedIn = UserDefaultsManager.shared().isLoggedin {
                    if isLoggedIn {
                        self.goToTabBarController(window: window)
                    } else {
                        self.goToSignInVC(window: window)
                    }
                } else {
                    self.goToSignUpVC(window: window)
                }
            }
        } else {
            self.goToFirstScreenVC(window: window)
        }
    }
    
    private static func goToSignInVC(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: SignInVC())
        window?.makeKeyAndVisible()
    }
    
    private static func goToSignUpVC(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: SignUpBasicInfoVC())
        window?.makeKeyAndVisible()
    }

    private static func goToFirstScreenVC(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: FirstScreenVC())
        window?.makeKeyAndVisible()
    }
    
    private static func goToTabBarController(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        window?.makeKeyAndVisible()
    }
}
