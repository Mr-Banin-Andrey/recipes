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
                CustomTextField(title: "Продукт", text: $name)
                
                Divider()
            }
            
            VStack {
                CustomTextField(title: "Вес", text: $weight)
                    .frame(width: 50)
                    .multilineTextAlignment(.center)
                
                Divider()
                    .frame(width: 50)
                    .padding(.horizontal, 10)
            }
            
            Menu {
                Picker(selection: $quantityType) {
                    ForEach(QuantityType.allCases) { value in
                        Text(value.rawValue)
                            .tag(value)
                    }
                } label: {}
            } label: {
                VStack {
                    HStack {
                        Text(quantityType.rawValue)
                            .foregroundStyle(Color.text)
                            .keyboardType(.numberPad)
                     
                        Image(systemName: "chevron.up.chevron.down")
                            .foregroundStyle(Color.text)
                    }
                    
                    Divider()
                        .frame(width: 15)
                }
            }.id(quantityType)
        }
        .padding(.horizontal, 16)
    }
}
