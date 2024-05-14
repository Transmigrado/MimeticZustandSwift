//
//  MainViewScreen.swift
//  MimeticZustandSwift
//
//  Created by Jorge Acosta Alvarado on 14-05-24.
//

import SwiftUI
import Coordinator

struct MainViewScreen: View {
    
    @EnvironmentObject var store:  Store<[String:Int]>
    @Coordinator(for: AppDestination.self) var coordinator
    
    var body: some View {
        
        let useBearStore = store.useBearStore()
        let cancellable = store.subscribe { newState in
            print("State has changed ->: \(newState)")
        }
        
       return (
        VStack{
            Button("Add Bear") {
                useBearStore.increasePopulation()
            }
            Text("Hello, World! \(useBearStore.bears)")
            
            Button("Back ") {
                self.coordinator.trigger(.root)
            }
        }
       )
    }
}

#Preview {
    MainViewScreen()
}
