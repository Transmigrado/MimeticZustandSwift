//
//  Store.swift
//  MimeticZustandSwift
//
//  Created by Jorge Acosta Alvarado on 14-05-24.
//

import Combine

class Store<T>: ObservableObject {
    @Published var state: T

    init(initialState: T) {
        state = initialState
    }

    func create(mutator: @escaping (inout T) -> Void) {
        var newState = state
        mutator(&newState)
        state = newState
    }

    func create<U>(_ transform: (inout T) -> U) -> U {
        transform(&state)
    }
}


typealias UseBearStore = (bears: Int, increasePopulation: () -> (), removeAllBears: () -> ())

extension Store where T == [String: Int] {
    func useBearStore() -> UseBearStore {
   
        let useBearStore = UseBearStore(
            bears: self.state["bears", default: 0],
            increasePopulation: { self.state["bears", default: 0] += 1 },
            removeAllBears: { self.state["bears"] = 0 }
        )
        return useBearStore
    }
}
