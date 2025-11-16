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
    var mealTimeType: MealTimeType
    var recipe: Recipe?
    
    var dishList: DishList?
    
    init(id: String, mealTimeType: MealTimeType, recipe: Recipe? = nil) {
        self.id = id
        self.mealTimeType = mealTimeType
        self.recipe = recipe
    }
}

extension DiningTime {
    static let mockArray: [DiningTime] = [
        DiningTime(id: UUID().uuidString, mealTimeType: .breakfast),
        DiningTime(id: UUID().uuidString, mealTimeType: .lunch),
        DiningTime(id: UUID().uuidString, mealTimeType: .afternoonSnack),
        DiningTime(id: UUID().uuidString, mealTimeType: .dinner),
    ]
}
