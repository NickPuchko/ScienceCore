//
//  AppDelegate.swift
//  iOS_ScienceCore
//
//  Created by Administrator on 27.11.2020.
//
//

import UIKit
import Firebase


@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
    // Override point for customization after application launch.
    return true
    }

}
