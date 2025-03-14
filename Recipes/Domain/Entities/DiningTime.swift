//
//  MealTime.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import SwiftData

@Model
final class DiningTime {
    @Attribute(.unique)
    var id: String
    var mealTimeType: MealTimeType
    var recipe: Recipe
    
    init(id: String, mealTimeType: MealTimeType, recipe: Recipe) {
        self.id = id
        self.mealTimeType = mealTimeType
        self.recipe = recipe
    }
}
