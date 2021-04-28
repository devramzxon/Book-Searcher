//
//  AppDelegate.swift
//  Book Searcher
//
//  Created by Ramzxon Maxmudov on 28/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let router = SearchRouter.start()
        let initialVC = router.entry
        self.window  = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: initialVC!)
        window?.makeKeyAndVisible()
        return true
    }

}

