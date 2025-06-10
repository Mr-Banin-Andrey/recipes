//
//  AddIngredientView.swift
//  Recipes
//
//  Created by Андрей Банин on 08.03.2025.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Binding var name: String
    @Binding var weight: String
    @Binding var quantityType: QuantityType
        
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 17) {
                TextField("Продукт", text: $name)
                    .foregroundStyle(Color.titleColorForRecipeCell)
                
                CustomDivider(color: .fifth)
            }
            
            VStack(spacing: 17) {
                TextField("Вес", text: $weight)
                    .frame(width: 50)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .submitLabel(.done)
                    .foregroundStyle(Color.titleColorForRecipeCell)
                
                CustomDivider(wigth: 50, color: .second)
                    .padding(.horizontal, 10)
            }

            VStack(spacing: 0) {
                QuantityPickerWheelView(quantityType: $quantityType)
                                
                Spacer()
                    .frame(height: 18)
                
                Rectangle()
                    .fill(Color.fourth)
                    .frame(maxWidth: 35, maxHeight: 0.6)
            }
            .frame(height: 44)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AddIngredientView(name: .constant("cucumber"), weight: .constant("400"), quantityType: .constant(.gram))
}
