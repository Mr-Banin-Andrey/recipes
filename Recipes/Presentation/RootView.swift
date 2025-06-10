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
        TabView {
            MenuScreenView(viewModel: MenuScreenViewModel())
                .tabItem {
                    Label("Меню", systemImage: "fork.knife")
                }
            RecipesScreenView(viewModel: RecipesScreenViewModel())
                .tabItem {
                    Label("Рецепты", systemImage: "book")
                }
            ShoppingListScreenView(viewModel: ShoppingListScreenViewModel())
                .tabItem {
                    Label("Покупки", systemImage: "basket")
                    
                }
        }
        .tint(.selectedText)
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = .tabBar
            
            let standardAppearance = UITabBarAppearance()
            standardAppearance.shadowColor = .lineAboveTabbar
            
            UITabBar.appearance().standardAppearance = standardAppearance
            UITabBar.appearance().scrollEdgeAppearance = standardAppearance
        })
    }
}

#Preview {
    RootView()
}
