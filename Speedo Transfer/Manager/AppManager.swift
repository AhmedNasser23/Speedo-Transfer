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
        window?.rootViewController = UINavigationController(rootViewController: SignUpAdditionalInfoVC())
        window?.makeKeyAndVisible()
    }
}
