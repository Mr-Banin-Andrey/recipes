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
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(ingredientName)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(Color.mainText)
                
                Spacer()
                
                HStack(spacing: 0) {
                    TextField("", text: $weight)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .frame(width: 50)
                    
                    QuantityPickerWheelView(quantityType: $quantity)
                }
            }
                        
            CustomDivider(color: color)
                .padding(.top, 12)
        }
        .padding(.top, 12)
        
    }
}

#Preview {
    WillBuyIngredientView(ingredientName: "Cucumber", weight: .constant("400"), quantity: .constant(.gram), color: .fifth)
}
