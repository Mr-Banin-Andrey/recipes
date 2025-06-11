//
//  ExtView.swift
//  Recipes
//
//  Created by Андрей Банин on 11.03.2025.
//

import SwiftUI

extension View {
    func colorForDivider(num: Int) -> Color {
        let index = num % 4
        
        switch index {
        case 0:
            return Color.firstDivirer
        case 1:
            return Color.secondDivirer
        case 2:
            return Color.thirdDivirer
        case 3:
            return Color.fourthDivider
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
    
    //TODO: зарефачить, чтоб каждые 5 элементов был цвет разный цвет
    func colorForRecipeBackground(num: Int) -> Color {
        let index = num % 5
        switch index {
        case 0:
            return Color.fifth
        case 1:
            return Color.fourth
        case 2:
            return Color.first
        case 3:
            return Color.third
        case 4:
            return Color.second
        default:
            return Color.clear
        }
    }
}
