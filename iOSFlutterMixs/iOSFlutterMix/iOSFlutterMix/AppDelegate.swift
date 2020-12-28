//
//  AppDelegate.swift
//  iOSFlutterMix
//
//  Created by Chiu Young on 2020/12/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let vc = ViewController()
        let Nav = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = Nav
        window?.makeKeyAndVisible()
        return true
    }




}

