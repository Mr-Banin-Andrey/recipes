//
//  Ingredient.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import Foundation

struct Ingredient: Hashable, Identifiable {
    let id: String
    var name: String
    var weight: String
    var quantity: QuantityType
}
