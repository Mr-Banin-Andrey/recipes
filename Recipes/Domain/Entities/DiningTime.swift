//
//  MealTime.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import Foundation
import SwiftData

@Model
final class DiningTime : Hashable, Identifiable {
    @Attribute(.unique)
    var id: String
    var mealTimeType: MealTimeType
    var recipe: Recipe
    var dishList: DishList?
    
    init(id: String, mealTimeType: MealTimeType, recipe: Recipe) {
        self.id = id
        self.mealTimeType = mealTimeType
        self.recipe = recipe
    }
}

extension DiningTime {
        
    static let mockArray: [DiningTime] = [
        DiningTime(id: UUID().uuidString, mealTimeType: .breakfast, recipe: Recipe.mockRecipe),
        DiningTime(id: UUID().uuidString, mealTimeType: .lunch, recipe: Recipe.mockRecipe),
        DiningTime(id: UUID().uuidString, mealTimeType: .afternoonSnack, recipe: Recipe.mockRecipe),
        DiningTime(id: UUID().uuidString, mealTimeType: .dinner, recipe: Recipe.mockRecipe)
    ]
}
