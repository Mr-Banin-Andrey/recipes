//
//  ShoppingListView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct ShoppingListScreenView: View {
    
    @StateObject var viewModel: ShoppingListScreenViewModel
    
    var body: some View {
//        NavigationView {
//        List {
//            <#code#>
//        }
        NavigationStack{
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Circle()
                        .foregroundStyle(Color.yellow)
                        .frame(width: 50, height: 50)
                        .padding()
                    
                    Text("Овсянка")
                        .font(.title3)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        TextField("", text: .constant("400"))
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                            .frame(width: 50)
                        
                        QuantityPickerWheelView(quantityType: $viewModel.shoppingList[0].quantity)
                    }
                    .padding(.trailing, 16)
                }
                
                Spacer()
                    
            }
            .modifier(NavigationBarTitleModifier(title: "Моя корзина", color: .shoppingList))
        }
    }
}

#Preview {
    ShoppingListScreenView(viewModel: ShoppingListScreenViewModel())
}
