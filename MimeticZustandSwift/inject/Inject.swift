//
//  Inject.swift
//  MimeticZustandSwift
//
//  Created by Jorge Acosta Alvarado on 14-05-24.
//

import Foundation
import Swinject

enum InjectName:String {
    case main
    case root
}

extension Container {
    func resolve<R>(from: InjectName) -> R {
        let r:Inject<R> = resolve(InjectContainer.self, name: from.rawValue) as! Inject<R>
        return r.value
    }

    func register<T>(from: InjectName, value:T){
        register(InjectContainer.self, name: from.rawValue) {_ in Inject<T>(value: value)}
    }
}

protocol InjectContainer {
}

struct Inject<T>:InjectContainer{
    var value: T
    init(value:T) {
        self.value = value
    }
}
