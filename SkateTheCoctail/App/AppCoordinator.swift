//
//  AppCoordinator.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//

import RxSwift
import UIKit
class AppCoordinator: ReactiveCoordinator<Void> {
    var window : UIWindow
    
    init(window : UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let loginViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.setNavigationBarHidden(true, animated: true)
        let splashCoordinator = SplashCoordinator(rootViewController: loginViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return coordinate(to: splashCoordinator)
    }
}
