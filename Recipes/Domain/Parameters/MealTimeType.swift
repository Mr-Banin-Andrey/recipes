//
//  MealTimeType.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import Foundation

enum MealTimeType: String, Identifiable, CaseIterable, Codable {
    case breakfast
    case secondBreakfast
    case lunch
    case afternoonSnack
    case dinner
    case snack
    
    var id: Self {
        self
    }
    
    var localizedDescription: String {
        switch self {
        case .breakfast:
            return "Завтрак"
        case .secondBreakfast:
            return "Второй завтрак"
        case .lunch:
            return "Обед"
        case .afternoonSnack:
            return "Полдник"
        case .dinner:
            return "Ужин"
        case .snack:
            return "Перекус"
        }
    }
}
