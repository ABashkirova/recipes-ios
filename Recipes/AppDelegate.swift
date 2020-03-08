//
//  AppDelegate.swift
//  Recipes
//
//  Created by Александра Башкирова on 04/01/2019.
//  Copyright © 2019 Александра Башкирова. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var container: Container?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        container = Container()
        let _ = Assembler([UIAssembly(), ServiceAssembly()], container: container!)
        window = UIWindow(frame: UIScreen.main.bounds)
        var viewController: UIViewController
        
        viewController = container!.resolve(TabBarConfigurator.self)!.configure()
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }

}
