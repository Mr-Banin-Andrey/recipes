//
//  RecipesApp.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import SwiftData

@main
struct RecipesApp: App {
    
    init() {
        let stateKeeper = StateKeeper()
        GlobalDependencyContainer.register(type: StateKeeper.self, stateKeeper)
        
        let database = SwiftDataService()
        GlobalDependencyContainer.register(type: SwiftDataService.self, database)
        
        stateKeeper.recipes = database.fetchData(model: Recipe.self)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
