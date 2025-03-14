//
//  TheDishList.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import Foundation
import SwiftData

@Model
final class TheDishList  {
    @Attribute(.unique)
    var id: String
    var date: Date
    var mealTime: [DiningTime]

    init(id: String, date: Date, mealTime: [DiningTime]) {
        self.id = id
        self.date = date
        self.mealTime = mealTime
    }
}
