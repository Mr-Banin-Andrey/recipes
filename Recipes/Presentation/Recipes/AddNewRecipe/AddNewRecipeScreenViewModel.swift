//
//  AddNewRecipeScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 08.03.2025.
//

import SwiftUI
import SwiftData
import Combine

final class AddNewRecipeScreenViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var menuSection: MenuSectionType = .breakfasts
    @Published var instruction: String = ""
    @Published var ingredients: [Ingredient] = [Ingredient(
        id: UUID().uuidString,
        name: "",
        weight: "",
        quantity: .gram
    )]
    
    @Dependency private var stateKeeper: StateKeeper
    @Dependency private var database: SwiftDataService

    func addIngredient() {
        ingredients.append(Ingredient(
            id: UUID().uuidString,
            name: "",
            weight: "",
            quantity: .gram
        ))
    }
    
    @MainActor
    func saveRecipe() {
//        let ingredients = ingredients.filter { $0.name != "" }
//
//        let recipe = Recipe(
//            id: UUID().uuidString,
//            name: name,
//            meal: menuSection,
//            instruction: instruction,
//            ingredients: ingredients
//        )
//        
//        database.saveData(recipe)
//        stateKeeper.recipes.append(recipe)
    }
}
