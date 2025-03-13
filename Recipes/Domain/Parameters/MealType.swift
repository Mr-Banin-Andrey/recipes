//
//  MealType.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import Foundation

enum MealType: String, Identifiable, CaseIterable, Codable {
    case breakfast
    case soup
    case entree
    case salad
    case snack
    case drink
    case dessert
    case unknown
    
    var id: Self {
        self
    }
    
    var localizedDescription: String {
        switch self {
        case .breakfast:
            return "Завтрак"
        case .soup:
            return "Первое"
        case .entree:
            return "Второе"
        case .salad:
            return "Салат"
        case .snack:
            return "Перекус"
        case .drink:
            return "Напиток"
        case .dessert:
            return "Десерт"
        case .unknown:
            return ""
        }
    }
}
