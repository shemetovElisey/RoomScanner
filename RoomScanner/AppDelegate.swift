//
//  AppDelegate.swift
//  RoomScanner
//
//  Created by Shemetov Elisey on 20.11.2022.
//

import UIKit
import RoomPlan

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    @UserDefault("isFirstLaunch")
    var isFirstLaunch: Bool = true
    
    private enum ConfigurationType: String {
        case firstLaunch = "Default Configuration"
        case scanner = "Scanner Configuration"
        case unsupported = "Unsupported Device"
        
        init(for isFirstLaunch: Bool) {
            guard RoomCaptureSession.isSupported else {
                self = .unsupported
                return
            }
            
            self = isFirstLaunch ? .firstLaunch : .scanner
        }
    }
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let configurationName = ConfigurationType(for: isFirstLaunch).rawValue
        
        return UISceneConfiguration(name: configurationName, sessionRole: connectingSceneSession.role)
    }
}

