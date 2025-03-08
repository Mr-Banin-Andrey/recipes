//
//  AddNewRecipeScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 08.03.2025.
//

import SwiftUI

final class AddNewRecipeScreenViewModel: ObservableObject {
        
    @Published var name: String = ""
    @Published var instruction: String = ""
    @Published var meal: MealType = .breakfast
    @Published var ingredients: [Ingredient] = [Ingredient(
        id: UUID().uuidString,
        name: "",
        weight: "",
        quantity: .kilogram
    )]
    
    
    
    func addIngredient() {
        ingredients.append(Ingredient(
            id: UUID().uuidString,
            name: "",
            weight: "",
            quantity: .kilogram
        ))
    }
    
    func saveRecipe() {
        print("🩷", name, instruction, meal)
        ingredients.forEach { ingredient in
            print("🐸", ingredient.id, ingredient)
        }
    }
}
