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
            VStack {
                TextField("Продукт", text: $name)
                
                Divider()
            }
            
            VStack {
                TextField("Вес", text: $weight)
                    .frame(width: 50)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .submitLabel(.done)
                
                Divider()
                    .frame(width: 50)
                    .padding(.horizontal, 10)
            }

            VStack {
                QuantityPickerWheelView(quantityType: $quantityType)
                
                Divider()
                    .frame(width: 15)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AddIngredientView(name: .constant("cucumber"), weight: .constant("400"), quantityType: .constant(.gram))
}
