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
            MenuView()
                .tabItem {
                    Label("Меню", systemImage: "fork.knife")
                }
            RecipesView()
                .tabItem {
                    Label("Рецепты", systemImage: "scroll")
                }
            ShoppingListView()
                .tabItem {
                    Label("Покупки", systemImage: "checklist")
                }
        }
        .tint(.blue)
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
        })
    }
}

#Preview {
    RootView()
}
