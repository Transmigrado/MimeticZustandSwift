//
//  RootViewScreen.swift
//  MimeticZustandSwift
//
//  Created by Jorge Acosta Alvarado on 14-05-24.
//

import SwiftUI

struct RootViewScreen: View {
    
    @EnvironmentObject var store:  Store<[String:Int]>
 
  
    var body: some View {
        
        let useBearStore = store.useBearStore()
        
        return VStack {
            Text("Bears: \(useBearStore.bears)")
            Button("Add Bear") {
                useBearStore.increasePopulation()
            }
            Button("Remove All Bears") {
                useBearStore.removeAllBears()
            }
        }
    }
}

