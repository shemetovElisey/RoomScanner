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

    private enum ConfigurationType: String {
        case hasLidar = "Default Configuration"
        case unsupported = "Unsupported Device"
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
        let configurationName = RoomCaptureSession.isSupported ?
            ConfigurationType.hasLidar.rawValue : ConfigurationType.unsupported.rawValue
        
        return UISceneConfiguration(name: configurationName, sessionRole: connectingSceneSession.role)
    }
}

