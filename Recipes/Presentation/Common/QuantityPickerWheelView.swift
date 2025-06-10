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
        ZStack {
            Menu {
                Picker(selection: $quantityType) {
                    ForEach(QuantityType.allCases) { value in
                        Text(value.localizedDescription)
                            .tag(value)
                    }
                } label: {}
            } label: {
                HStack(alignment: .bottom) {
                    Text(quantityType.localizedDescription)
                        .foregroundStyle(Color.mainText)
                    
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundStyle(Color.mainText)
                }
            }.id(quantityType)
        }
    }
}

#Preview {
    QuantityPickerWheelView(quantityType: .constant(.gram))
}
