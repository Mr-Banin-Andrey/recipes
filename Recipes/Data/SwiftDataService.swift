//
//  SwiftDataContextManager.swift
//  Recipes
//
//  Created by Андрей Банин on 18.03.2025.
//

import Foundation
import SwiftData

@MainActor
class SwiftDataService: ObservableObject {
    
    private var container: ModelContainer?
    private var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(for: Recipe.self, Ingredient.self, DishList.self, DiningTime.self)
            if let container {
                let modelContext = ModelContext(container)
                modelContext.autosaveEnabled = false
                context = modelContext
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
    
    func deleteData<T: PersistentModel>(_ data: T) {
        do {
            if let context {
                context.delete(data)
                try context.save()
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
