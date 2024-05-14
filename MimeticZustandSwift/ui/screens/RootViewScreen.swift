//
//  RootViewScreen.swift
//  MimeticZustandSwift
//
//  Created by Jorge Acosta Alvarado on 14-05-24.
//

import SwiftUI
import Coordinator

struct RootViewScreen: View {
    
    @EnvironmentObject var store:  Store<[String:Int]>
    @Coordinator(for: AppDestination.self) var coordinator
  
    var body: some View {
        
        let useBearStore = store.useBearStore()
        let cancellable = store.subscribe { newState in
            print("State has changed ->: \(newState)")
        }
        
        return VStack {
            Text("Bears: \(useBearStore.bears)")
            Button("Add Bear") {
                useBearStore.increasePopulation()
            }
            Button("Remove All Bears") {
                useBearStore.removeAllBears()
            }
            
            Button("Go other screen"){
                self.coordinator.trigger(.main)
            }
        }
    }
}

