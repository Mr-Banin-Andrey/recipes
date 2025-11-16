//
//  MealType.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import Foundation

enum MenuSectionType: String, Identifiable, CaseIterable, Codable {
    case breakfasts
    case soups
    case mainCourses 
    case salads
    case starters
    case drinks
    case dessert
    
    var id: Self {
        self
    }
    
    var localizedDescription: String {
        switch self {
        case .breakfasts:
            return "Завтраки"
        case .soups:
            return "Супы"
        case .mainCourses:
            return "Основные блюда"
        case .salads:
            return "Салаты"
        case .starters:
            return "Закуски"
        case .drinks:
            return "Напитки"
        case .dessert:
            return "Десерты"
        }
    }
}
