//
//  GlobalDependencyContainer.swift
//  Recipes
//
//  Created by Андрей Банин on 19.03.2025.
//

import Foundation

public struct GlobalDependencyContainer {
    private static var assemblers: [String: () -> Any] = [:]
    private static var cache: [String: Any] = [:]
}

extension GlobalDependencyContainer {
    
    public static func register<T>(type: T.Type, _ assembler: @autoclosure @escaping () -> T) {
        assemblers[String(describing: type.self)] = assembler
    }
    
    public static func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type.self)
        
        if let cachedDependency = cache[key] as? T {
            return cachedDependency
        } else {
            return assemblers[key]?() as? T
        }
    }
}
