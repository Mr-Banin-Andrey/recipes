//
//  ShoppingListScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 10.03.2025.
//

import SwiftUI

final class ShoppingListScreenViewModel: ObservableObject {
    
    @Published var shoppingList: [Ingredient] = [
        Ingredient(id: UUID().uuidString, name: "Соль", weight: "1", quantity: QuantityType.gram)
    ]
}
