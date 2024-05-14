//
//  AppCoordinator.swift
//  MimeticZustandSwift
//
//  Created by Jorge Acosta Alvarado on 14-05-24.
//

import Foundation
import SwiftUI
import Coordinator
import Swinject

class AppCoordinator: AppKitOrUIKitWindowCoordinator<AppDestination> {
    
    var container: Container
    var store: Store<[String:Int]>

    
    init(container: Container, store: Store<[String:Int]> ){
        self.container = container
        self.store = store
    }
    
    override func transition(for route: AppDestination) -> ViewTransition {
        switch route {
            case .main:
                let mainView: MainViewScreen = container.resolve(from: .main)
            return .set(mainView.environmentObject(store))
            case .root:
                let mainView: RootViewScreen = container.resolve(from: .root)
            return .set(mainView.environmentObject(store))
        }
    }
}
