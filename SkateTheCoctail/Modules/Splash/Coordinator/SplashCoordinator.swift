//
//  SplashCoordinator.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//

import Foundation
import UIKit
import RxSwift

class SplashCoordinator: ReactiveCoordinator<Void> {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let viewController = ViewController()
        let viewModel = SplashVM()
        viewController.viewModel = viewModel
        
        viewModel.goMain.map { _ in
            self.goToMain()
        }.subscribe().disposed(by: disposeBag)
        
        self.rootViewController.navigationController?.pushViewController(viewController, animated: true)
        return Observable.never()
    }
    
  private func goToMain() -> Observable<Void> {
   let mainCoordinator = MainCoordinator(rootViewController: self.rootViewController)
    return coordinate(to: mainCoordinator)
  }
}

