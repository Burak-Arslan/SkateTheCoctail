//
//  BaseVC.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//


import UIKit
import RxSwift
import Lottie

class BaseVC<T>: UIViewController where T : BaseVM {
    var viewModel : T?
    let loadingDisposeBag = DisposeBag()
    var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.showLoading.subscribe(onNext: {(isLoading) in
            if isLoading{
                self.startIndicatingActivity()
            }else{
                self.stopIndicatingActivity()
            }
            
        }).disposed(by: loadingDisposeBag)
        viewModel?.error.subscribe(onNext : {(data) in
            let alert = UIAlertController(title: "Hata", message: data, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true)
        }).disposed(by: loadingDisposeBag)
    }
    
}

struct AlertAction {
    var title: String
    var style: UIAlertAction.Style
    
    static func action(title: String, style: UIAlertAction.Style = .default) -> AlertAction {
        return AlertAction(title: title, style: style)
    }
}

extension BaseVC {
    
    func showAlert(title: String?, message: String?, style: UIAlertController.Style, actions: [AlertAction]) -> Observable<Int>
    {
        return Observable.create { observer in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            
            actions.enumerated().forEach { index, action in
                let action = UIAlertAction(title: action.title, style: action.style) { _ in
                    observer.onNext(index)
                    observer.onCompleted()
                }
                alertController.addAction(action)
            }
            
            self.present(alertController, animated: true, completion: nil)
            
            return Disposables.create { alertController.dismiss(animated: true, completion: nil) }
        }
    }
}

