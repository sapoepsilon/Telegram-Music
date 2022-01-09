//
//  ApplicationController.swift
//  Telegram Music
//
//  Created by Ismatulla Mansurov on 1/8/22.
//

import Foundation
import UIKit

final class ApplicationController {
    
    static var window: UIWindow?
    
    static func showFirstController(_ window: UIWindow) {
        ApplicationController.window = window
        showAuth()
    }
    
    static func showMain() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateInitialViewController() as? MainViewController
        window?.rootViewController = vc
    }
    
    static func showAuth() {
        let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = authStoryboard.instantiateInitialViewController() as? AuthViewController
        window?.rootViewController = vc
    }
}
