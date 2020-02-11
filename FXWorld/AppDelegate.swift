//
//  AppDelegate.swift
//  CoordinatorSample
//
//  Created by Aldo Bergamini on 26/11/2019.
//  Copyright © 2018 - 2019 iBat Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ViewTarget {
    
    // MARK: Business Logic Properties
    
    var coordinator: Coordinator?
    var appController: AppController?
    
    // MARK: App Process Life Cycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.appController = AppController()
        self.coordinator = AppCoordinator(target: self.appController!)
        self.appController?.coordinator = self.coordinator
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

