//
//  RecipesStore.swift
//  Recipes
//
//  Created by Андрей Банин on 12.11.2025.
//

import SwiftUI
import SwiftData
import Combine

final class RecipesStore: ObservableObject {
        
    @Published var mealType: MenuSectionType = .breakfasts
    @Published var mealTypes: [MenuSectionType] = []
    @Published var recipes: [Recipe] = Recipe.fourRecipe
        
    var cancellables: Set<AnyCancellable> = []
    
    init() {
//        stateKeeper.$recipes
//            .sink { value in
//                self.recipes = value
//            }
//            .store(in: &cancellables)
    }
    
    func getIndex(of recipe: Recipe) -> Int {
        let recipesFilter = recipes.filter { $0.meal == mealType }
        guard let index = recipesFilter.firstIndex(of: recipe) else {
            return 0
        }
        return index
    }
    
    @Published var name: String = ""
    @Published var menuSection: MenuSectionType = .breakfasts
    @Published var instruction: String = ""
    @Published var ingredients: [Ingredient] = [Ingredient(
        id: UUID().uuidString,
        name: "",
        weight: "",
        quantity: .gram
    )]

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
