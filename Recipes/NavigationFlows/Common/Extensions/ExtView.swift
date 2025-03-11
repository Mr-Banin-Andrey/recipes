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
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.yellow
        default:
            return Color.clear
        }
    }
}
