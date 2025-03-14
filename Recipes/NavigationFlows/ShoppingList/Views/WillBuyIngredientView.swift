//
//  BuyIngredientView.swift
//  Recipes
//
//  Created by Андрей Банин on 10.03.2025.
//

import SwiftUI

struct WillBuyIngredientView: View {
    var ingredientName: String
    @Binding var weight: String
    @Binding var quantity: QuantityType
    
    var color: Color
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
//                Circle()
//                    .foregroundStyle(Color.yellow)
//                    .frame(width: 50, height: 50)
                
                Text(ingredientName)
                    .font(.title3)
                    .padding(.leading, 16)
                
                Spacer()
                
                HStack(spacing: 0) {
                    TextField("", text: $weight)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .frame(width: 50)
                    
                    QuantityPickerWheelView(quantityType: $quantity)
                }
            }
            
            Divider()
                .background(color)
        }
    }
}

#Preview {
    WillBuyIngredientView(ingredientName: "Cucumber", weight: .constant("400"), quantity: .constant(.gram), color: .blue)
}
