//
//  MainVM.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//

import Foundation
import RxCocoa
import RxSwift

class MainVM: BaseVM {
    let disposeBag = DisposeBag()
    
    var cocktailInfo = PublishSubject<CocktailResponse>()


    func getCocktail(){
        self.showLoading.onNext(true)
        NetworkManager.shared.getCocktail().subscribe(onNext: { data in
            self.cocktailInfo.onNext(data)
            }, onError: { error in
                self.showLoading.onNext(false)
                self.error.onNext(error.localizedDescription)
            }, onCompleted: {
                self.showLoading.onNext(false)
                print("onCompleted")
            }).disposed(by: disposeBag)
    }
}
