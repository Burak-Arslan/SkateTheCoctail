//
//  NetworkManager.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//
import Foundation
import Moya
import RxSwift
import RxMoya

struct NetworkManager {

    private let provider = MoyaProvider<CoctailService>()
    
    static let shared = NetworkManager()
    
    init() {
        
    }
    
    func getCocktail() -> Observable<CocktailResponse> {
        return request(.getCocktail)
    }

    
    func request<T: Codable>(_ request: CoctailService) -> Observable<T> {
        self.provider.rx
            .request(request)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes().map(T.self)
            .catchError { error in
            return Observable.error(error)
        }
    }
}

