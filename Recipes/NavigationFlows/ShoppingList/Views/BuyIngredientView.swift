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
    
    @State var isSelected: Bool = false
    
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 5) {
            Button {
                withAnimation {
                    isSelected.toggle()
                    action()
                }
            } label: {
                Circle()
                    .foregroundStyle(isSelected ? Color.green : Color.clear)
                    .padding(3)
                    .overlay(
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .fill(color)
                    )
                    .frame(width: 34, height: 34)
            }

            Text(ingredientName + ",")
                .padding(.leading, 16)
                .strikethrough(isSelected)
                .opacity(isSelected ? 0.5 : 1)
            
            Text(weight)
                .strikethrough(isSelected)
                .opacity(isSelected ? 0.5 : 1)
                        
            Text(quantity.localizedDescription + ".")
                .strikethrough(isSelected)
                .opacity(isSelected ? 0.5 : 1)
            
            Spacer()
        }
    }
}

#Preview {
    BuyIngredientView(ingredientName: "Apple", weight: "500", quantity: .gram, color: .yellow) {
        print("123")
    }
}

