//
//  QuantityType.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import Foundation

enum QuantityType: String, Identifiable, CaseIterable {
    case perPiece = "шт"
    case gram = "г"
    case kilogram = "кг"
    case milliliter = "мл"
    case liter = "л"
    
    var id: Self {
        self
    }
    
    var localizedDescription: String {
        switch self {
        case .perPiece:
            return "шт"
        case .gram:
            return "г"
        case .kilogram:
            return "кг"
        case .milliliter:
            return "мл"
        case .liter:
            return "л"
        }
    }
}
