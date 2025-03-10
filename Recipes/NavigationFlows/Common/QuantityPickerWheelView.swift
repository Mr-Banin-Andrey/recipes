//
//  QuantityPickerWheelView.swift
//  Recipes
//
//  Created by Андрей Банин on 10.03.2025.
//

import SwiftUI

struct QuantityPickerWheelView: View {
    
    @Binding var quantityType: QuantityType
    
    var body: some View {
        
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
                 
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundStyle(Color.text)
                }
            }
        }.id(quantityType)
    }
}
