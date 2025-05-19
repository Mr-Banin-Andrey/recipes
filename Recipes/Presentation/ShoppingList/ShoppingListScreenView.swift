//
//  ShoppingListView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct ShoppingListScreenView: View {
    @StateObject var viewModel: ShoppingListScreenViewModel
    
    @State private var isEnableButton: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isEnableButton {
                    HStack {
                        Text("Чтобы завершить покупки, отметьте купленные продукты или удалите их из списка.")
                            .padding(16)
                        Spacer()
                    }
                }
                
                List($viewModel.shoppingList) { ingredient in
                    if let index = viewModel.shoppingList.firstIndex(of: ingredient.wrappedValue) {
                        
                        if isEnableButton {
                            BuyIngredientView(
                                ingredientName: ingredient.name.wrappedValue,
                                weight: ingredient.weight.wrappedValue,
                                quantity: ingredient.quantity.wrappedValue,
                                color: colorForDivider(num: index)) { 
                                    viewModel.addingOrRemovingIngredientFromPurchasedProducts(ingredient.wrappedValue)
                                }
                            .listRowSeparator(.hidden)
                        } else {
                            WillBuyIngredientView(
                                ingredientName: ingredient.name.wrappedValue,
                                weight: ingredient.weight,
                                quantity: ingredient.quantity,
                                color: colorForDivider(num: index))
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    viewModel.shoppingList.remove(at: index)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
           
            Button {
                isEnableButton.toggle()
            } label: {
                Text(isEnableButton ? "Завершить покупки" :"Подтвердить набор продуктов")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.yellow)
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)
                    .opacity(isEnableButton ? 0.5 : 1)
            }
            
            .modifier(NavigationBarTitleModifier(title: isEnableButton ? "Список покупок" : "Моя корзина", color: .navBar))
        }
    }    
}

#Preview {
    ShoppingListScreenView(viewModel: ShoppingListScreenViewModel())
}
