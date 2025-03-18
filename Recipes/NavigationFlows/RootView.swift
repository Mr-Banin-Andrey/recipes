//
//  ContentView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct RootView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuScreenView(viewModel: MenuScreenViewModel(dataStore: SwiftDataService(model: TheDishList.self)))
                .tabItem {
                    Label("Меню", image: selectedTab == 0 ? "menuSelectedImage" : "menuImage")
                }
                .tag(0)
            RecipesScreenView(viewModel: RecipesScreenViewModel(dataStore: SwiftDataService(model: Recipe.self)))
                .tabItem {
                    Label("Рецепты", image: selectedTab == 1 ? "recipeSelectedImage" : "recipeImage")
                }
                .tag(1)
            ShoppingListScreenView(viewModel: ShoppingListScreenViewModel())
                .tabItem {
                    Label("Покупки", image: selectedTab == 2 ? "shoppinglistSelectedImage" : "shoppinglistImage")
                }
                .tag(2)
        }
        .tint(.selectedText)
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = .tabBar
        })
    }
}

#Preview {
    RootView()
}
