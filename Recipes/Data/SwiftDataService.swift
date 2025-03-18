//
//  SwiftDataContextManager.swift
//  Recipes
//
//  Created by Андрей Банин on 18.03.2025.
//

import Foundation
import SwiftData

@MainActor
class SwiftDataService {
    
    private var container: ModelContainer?
    private var context: ModelContext?
    
    init(model: any PersistentModel.Type) {
        do {
            container = try ModelContainer(for: model)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            debugPrint("Error initializing database container:", error)
        }
    }
    
    func fetchData<T: PersistentModel>(model: T.Type) -> [T] {
        do {
            if let context {
                let data: [T] = try context.fetch(FetchDescriptor<T>())
                return data
            }
        } catch {
            fatalError(error.localizedDescription)
        }
        
        return []
    }
    
    func saveData<T: PersistentModel>(_ data: T) {
        do {
            if let context {
                context.insert(data)
                try context.save()
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
