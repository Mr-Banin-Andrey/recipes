//
//  QuantityType.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import Foundation

enum QuantityType: String, Identifiable, CaseIterable, Codable {
    case perPiece
    case gram
    case kilogram
    case milliliter
    case liter
    
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
