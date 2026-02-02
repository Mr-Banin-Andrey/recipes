//
//  MealTime.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import Foundation
import SwiftData

@Model
final class DiningTime: Hashable, Identifiable {
    @Attribute(.unique)
    var id: String
    var date: Date
    var mealTimeType: MealTimeType
    var recipe: Recipe
    
    init(
        id: String,
        date: Date,
        mealTimeType: MealTimeType,
        recipe: Recipe
    ) {
        self.id = id
        self.date = date
        self.mealTimeType = mealTimeType
        self.recipe = recipe
    }
}
