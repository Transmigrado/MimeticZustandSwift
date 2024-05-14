//
//  MimeticZustandSwiftApp.swift
//  MimeticZustandSwift
//
//  Created by Jorge Acosta Alvarado on 14-05-24.
//

import SwiftUI
import Swinject

@main
struct MimeticZustandSwiftApp: App {
    
    @StateObject private var coordinator: AppCoordinator
    let store: Store<[String:Int]>
    let container = Container()
      
    init(){
          
       store = Store(initialState: ["bears": 0])
       
       let coordinatorWrapped = AppCoordinator(container: container, store: store)
       self._coordinator = StateObject(wrappedValue: coordinatorWrapped)

       container.register(from: .root, value: RootViewScreen())
       container.register(from: .main, value: MainViewScreen())
          
        
    }
       
    var root: some View {
        let view: RootViewScreen = container.resolve(from: .root)
        return view.coordinator(coordinator).environmentObject(store)
    }
    
    var body: some Scene {
        WindowGroup {
            root
        }
    }
}
