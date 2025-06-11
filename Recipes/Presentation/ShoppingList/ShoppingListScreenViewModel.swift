//
//  ShoppingListScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 10.03.2025.
//

import SwiftUI

final class ShoppingListScreenViewModel: ObservableObject {
    
    @Published var shoppingList: [Ingredient] = [
        Ingredient(id: UUID().uuidString, name: "Соль", weight: "10", quantity: QuantityType.gram),
        Ingredient(id: UUID().uuidString, name: "Cucumber", weight: "400", quantity: QuantityType.gram),
        Ingredient(id: UUID().uuidString, name: "Milk", weight: "1", quantity: QuantityType.liter),
        Ingredient(id: UUID().uuidString, name: "Sugar", weight: "10", quantity: QuantityType.gram),
        Ingredient(id: UUID().uuidString, name: "Coconut", weight: "500", quantity: QuantityType.milliliter),
        Ingredient(id: UUID().uuidString, name: "Ice cream", weight: "100", quantity: QuantityType.gram)
    ]
    
    @Published var purchasedGoods: [Ingredient] = []
    @Published var isEditingIngredients: Bool = false
    @Published var recipes = Recipe.fourRecipe
    @Published var isOnQuestion: Bool = false
    
    func addingOrRemovingIngredientFromPurchasedProducts(_ ingredient: Ingredient) {
        if let index = purchasedGoods.firstIndex(of: ingredient) {
            purchasedGoods.remove(at: index)
        } else {
            purchasedGoods.append(ingredient)
        }
    }
    
    func deleteRecipe(at id: String) {
        if let index = recipes.firstIndex(where: {$0.id == id}) {
            recipes.remove(at: index)
        }
    }
}
