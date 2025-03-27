//
//  TheDishList.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import Foundation
import SwiftData

@Model
final class DishList : Hashable, Identifiable {
    @Attribute(.unique)
    var id: String
    var date: Date
    @Relationship(deleteRule: .cascade, inverse: \DiningTime.dishList)
    var mealTime: [DiningTime]

    init(id: String, date: Date, mealTime: [DiningTime]) {
        self.id = id
        self.date = date
        self.mealTime = mealTime
    }
}

extension DishList {
    static let mock = DishList(
        id: UUID().uuidString,
        date: Date.nowToday,
        mealTime: [
            DiningTime(id: UUID().uuidString, mealTimeType: .breakfast),
            DiningTime(id: UUID().uuidString, mealTimeType: .lunch),
            DiningTime(id: UUID().uuidString, mealTimeType: .afternoonSnack),
            DiningTime(id: UUID().uuidString, mealTimeType: .dinner)
        ]
    )
}
