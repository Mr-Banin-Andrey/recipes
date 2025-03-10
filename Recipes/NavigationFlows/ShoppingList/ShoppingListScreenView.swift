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
        NavigationStack {
            VStack {
                List($viewModel.shoppingList) { ingredient in
                    if let index = viewModel.shoppingList.firstIndex(of: ingredient.wrappedValue) {
                        BuyIngredientView(
                            ingredientName: ingredient.name.wrappedValue,
                            weight: ingredient.weight,
                            quantity: ingredient.quantity,
                            color: colorForDivider(num: index))
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
           
            Button {
                
            } label: {
                Text("Подтвердить набор продуктов")
            }
            
            .modifier(NavigationBarTitleModifier(title: "Моя корзина", color: .shoppingList))
        }
    }
    
    func colorForDivider(num: Int) -> Color {
        let index = num % 3
        
        switch index {
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.yellow
        default:
            return Color.clear
        }
    }
}

#Preview {
    ShoppingListScreenView(viewModel: ShoppingListScreenViewModel())
}
