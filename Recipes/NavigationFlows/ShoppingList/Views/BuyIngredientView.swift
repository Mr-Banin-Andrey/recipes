//
//  BuyIngredientView.swift
//  Recipes
//
//  Created by Андрей Банин on 11.03.2025.
//

import SwiftUI

struct BuyIngredientView: View {
    var ingredientName: String
    var weight: String
    var quantity: QuantityType
    var color: Color
    
    var body: some View {
        HStack(spacing: 5) {
            Circle()
                .foregroundStyle(Color.clear)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .fill(color)
                )
                .frame(width: 34, height: 34)

            Text(ingredientName + ",")
                .padding(.leading, 16)
            
            Text(weight)
                        
            Text(quantity.localizedDescription + ".")
            
            Spacer()
        }
    }
}

#Preview {
    BuyIngredientView(ingredientName: "Apple", weight: "500", quantity: .gram, color: .yellow)
}

