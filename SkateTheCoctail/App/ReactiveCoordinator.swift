//
//  ReactiveCoordinator.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//

import RxSwift
import Foundation

open class ReactiveCoordinator<ResultType> : NSObject{
        public let disposeBag = DisposeBag()
        private let identifier = UUID()
        private var childCoordinators = [UUID: Any]()
    
    private func store<T>(coordinator : ReactiveCoordinator<T>){
        childCoordinators[coordinator.identifier] = coordinator
    }
    private func release<T>(coordinator: ReactiveCoordinator<T>) {
            childCoordinators[coordinator.identifier] = nil
    }
    open func coordinate<T>(to coordinator: ReactiveCoordinator<T>) -> Observable<T> {
            store(coordinator: coordinator)
            return coordinator.start()
                .do(onNext: { [weak self] _ in
                    self?.release(coordinator: coordinator) })
    }
    open func start() -> Observable<ResultType> {
            fatalError("start() method must be implemented")
    }
}
