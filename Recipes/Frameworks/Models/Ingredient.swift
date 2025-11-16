//
//  Ingredient.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import SwiftData

@Model
final class Ingredient: Hashable, Identifiable {
    @Attribute(.unique)
    var id: String
    var name: String
    var weight: String
    var quantity: QuantityType
    
    init(id: String, name: String, weight: String, quantity: QuantityType) {
        self.id = id
        self.name = name
        self.weight = weight
        self.quantity = quantity
    }
}
