//
//  AppDelegate.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        app.router.start()
        
        return true
    }
}

