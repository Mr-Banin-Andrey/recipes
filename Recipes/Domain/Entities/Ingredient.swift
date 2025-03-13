//
//  Ingredient.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import SwiftData

//TODO: снести после обновления всех данных
//struct Ingredient: Hashable, Identifiable {
//    let id: String
//    var name: String
//    var weight: String
//    var quantity: QuantityType
//}

@Model
final class Ingredient: Hashable, Identifiable {
    var id: String
    var name: String
    var weight: String
    var quantity: QuantityType
    
    init(id: String, name: String, weight: String, quantity: QuantityType = .kilogram) {
        self.id = id
        self.name = name
        self.weight = weight
        self.quantity = quantity
    }
}
