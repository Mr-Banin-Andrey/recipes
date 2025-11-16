//
//  ShoppingListView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct ShoppingListScreen: View {
//    @StateObject var viewModel: ShoppingListScreenViewModel
    
    @EnvironmentObject private var store: ShoppingListStore
    
    var body: some View {
//        NavigationStack {
            VStack(spacing: 0) {
                if store.isOnQuestion {
                    ZStack {
                        HStack {
                            Text("- Для того чтоб отредактировать список покупок, нажмите кнопку 'Редактирование'\n\n- Чтобы завершить покупки нажмите кнопку 'Завершить покупки'.")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundStyle(Color.mainText)
                                .padding(8)
                            
                            Spacer()
                        }
                    }
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.thirdDivirer, lineWidth: 1))
                    .padding([.top, .horizontal], 16)
                }
                if !store.isEditingIngredients {
                    HStack {
                        Text("Готовлю сегодня:")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(Color.mainText)
                        
                        Spacer()
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(store.recipes, id: \.self) { recipe in
                                if let index = store.recipes.firstIndex(of: recipe) {
                                    ZStack(alignment: .topTrailing) {
                                        ZStack {
                                            Text(recipe.name)
                                                .font(.system(size: 18, weight: .regular))
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                                .padding(.horizontal, 8)
                                                .frame(width: 150, height: 75)
                                        }
                                        .padding(5)
                                        .background(colorForRecipeBackground(num: index))
                                        .clipShape(.rect(cornerRadius: 16))
                                        
                                        Button {
                                            withAnimation {
                                                store.deleteRecipe(at: recipe.id)
                                            }
                                        } label: {
                                            Image(systemName: "xmark")
                                                .font(.system(size: 14, weight: .semibold))
                                                .foregroundStyle(Color.mainText)
                                                .padding(8)
                                                .background(
                                                    Circle().foregroundStyle(Color.titleColorForRecipeCell.opacity(0.1))
                                                )
                                                .frame(maxWidth: 20, maxHeight: 20)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                    }
                    .padding(.top, 6)
                    
                    HStack {
                        Text("Необходимые продукты:")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(Color.mainText)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                }
                
                List($store.shoppingList) { ingredient in
                    if let index = store.shoppingList.firstIndex(of: ingredient.wrappedValue) {
                        if store.isEditingIngredients {
                            BuyIngredientView(
                                ingredientName: ingredient.name.wrappedValue,
                                weight: ingredient.weight.wrappedValue,
                                quantity: ingredient.quantity.wrappedValue,
                                color: colorForDivider(num: index)) {
                                    store.addingOrRemovingIngredientFromPurchasedProducts(ingredient.wrappedValue)
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                        } else {
                            WillBuyIngredientView(
                                ingredientName: ingredient.name.wrappedValue,
                                weight: ingredient.weight,
                                quantity: ingredient.quantity,
                                color: colorForDivider(num: index))
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    store.shoppingList.remove(at: index)
                                } label: {
                                    Label("Удалить", systemImage: "trash.fill")
                                    
                                }
                            }
                            .tint(Color.red)
                        }
                    }
                }
                .listStyle(.plain)
                .padding(.top, store.isEditingIngredients ? 16 : 0)
            }
            
            if store.isEditingIngredients {
                Button {
                    withAnimation {
                        store.isEditingIngredients.toggle()
                    }
                    
                } label: {
                    Text("Редактировать")
                        .modifier(GreenButtonModifier(textColor: .titleColorForRecipeCell, backgroundColor: .fourthDivider.opacity(1)))
                        .padding(.top, 16)
                        .shadow(radius: 2, x: 2, y: 2)
                }
            }
            
            Button {
                if store.isEditingIngredients {
                    
                } else {
                    withAnimation {
                        store.isEditingIngredients.toggle()
                    }
                }
            } label: {
                Text(store.isEditingIngredients ? "Завершить покупки" : "Подтвердить набор продуктов")
                    .modifier(GreenButtonModifier(textColor: .white, backgroundColor: .greenButton.opacity(1)))
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                    .shadow(radius: 2, x: 2, y: 2)
            }
            .modifier(NavigationBarTitleModifier(title: store.isEditingIngredients ? "Список покупок" : "Моя корзина", color: .navBar))
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if store.isEditingIngredients {
                        Button {
                            withAnimation {
                                store.isOnQuestion.toggle()
                            }
                        } label: {
                            Image(systemName: "questionmark.bubble")
                                .font(.body)
                                .foregroundStyle(Color.mainText)
                        }
                    }
                }
            }
//        }
    }
}

#Preview {
    ShoppingListScreen()
}
