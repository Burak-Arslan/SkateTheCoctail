//
//  BaseVM.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//


import Foundation
import RxSwift
class BaseVM {
    
    let showLoading = BehaviorSubject<Bool>(value: false)
    var error = PublishSubject<String>()
}
