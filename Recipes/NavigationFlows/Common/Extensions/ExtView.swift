//
//  ExtView.swift
//  Recipes
//
//  Created by Андрей Банин on 11.03.2025.
//

import SwiftUI

extension View {
    func colorForDivider(num: Int) -> Color {
        let index = num % 3
        
        switch index {
        case 0:
            return Color.first
        case 1:
            return Color.second
        case 2:
            return Color.third
        case 3:
            return Color.fourth
        case 4:
            return Color.fifth
        default:
            return Color.clear
        }
    }
    
    func colorForMealBackground(num: Int) -> Color {
        switch num {
        case 0:
            return Color.first
        case 1:
            return Color.second
        case 2:
            return Color.third
        case 3:
            return Color.fourth
        case 4:
            return Color.fifth
        default:
            return Color.clear
        }
    }
}
