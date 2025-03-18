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
    var body: some Scene {
        WindowGroup {
            RootView()
        }
//        .modelContainer(for: [Recipe.self, Ingredient.self], isAutosaveEnabled: false)
    }
}
