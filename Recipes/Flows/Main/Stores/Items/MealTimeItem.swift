//
//  MealTimeItem.swift
//  Recipes
//
//  Created by Андрей Банин on 12.02.2026.
//

import Foundation
import SwiftData

@Model
final class MealTimeItem: Hashable, Identifiable {
    var id: String
    var mealTypes: [MealTimeType]
//    /// Все последующие дни от этой даты
//    var dateOfChange: Date
    
    init(
        id: String,
        mealTypes: [MealTimeType]
//        dateOfChange: Date
    ) {
        self.id = id
        self.mealTypes = mealTypes
//        self.dateOfChange = dateOfChange
    }
}

extension MealTimeItem {
    static let item: MealTimeItem = MealTimeItem(
        id: UUID().uuidString,
        mealTypes: [
            .breakfast,
            .lunch,
            .afternoonSnack,
            .dinner
        ]
//            dateOfChange: nil
    )
    
    static let mockMealTimeItems: [MealTimeItem] = [
        MealTimeItem(
            id: UUID().uuidString,
            mealTypes: [
                .breakfast,
                .lunch,
                .dinner
            ]
//            dateOfChange: nil
        ),
        MealTimeItem(
            id: UUID().uuidString,
            mealTypes: [
                .breakfast,
                .lunch,
                .afternoonSnack,
                .dinner
            ]
//            dateOfChange: nil
        ),
        MealTimeItem(
            id: UUID().uuidString,
            mealTypes: [
                .breakfast,
                .lunch,
                .afternoonSnack,
                .dinner
            ]
//            dateOfChange: nil
        )
    ]
}
