//
//  ContentView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            MenuScreenView()
                .tabItem {
                    Label("Меню", systemImage: "fork.knife")
                }
            RecipesScreenView()
                .tabItem {
                    Label("Рецепты", systemImage: "scroll")
                }
            ShoppingListScreenView(viewModel: ShoppingListScreenViewModel())
                .tabItem {
                    Label("Покупки", systemImage: "checklist")
                }
        }
        .tint(.text)
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            UITabBar.appearance().unselectedItemTintColor = .secondaryText.withAlphaComponent(0.4)
            
        })
    }
}

#Preview {
    RootView()
}
