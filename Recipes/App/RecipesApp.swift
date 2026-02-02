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

    }
    
    var body: some Scene {
        WindowGroup {
            AppTabContainerView()
        }
        .modelContainer(for: Recipe.self)
        .modelContainer(for: Ingredient.self)
        .modelContainer(for: DiningTime.self)
    }
}
