//
//  DependencyWrapper.swift
//  Recipes
//
//  Created by Андрей Банин on 19.03.2025.
//

import Foundation

@propertyWrapper
struct Dependency<T> {
    var dependency: T
    
    init() {
        guard let dependency = GlobalDependencyContainer.resolve(T.self) else {
            fatalError("Dependency \(T.self) was attemted to resolve but was never registered")
        }
        self.dependency = dependency
    }
    
    var wrappedValue: T {
        get { dependency }
        set { dependency = newValue }
    }
}
