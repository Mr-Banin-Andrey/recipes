//
//  AppScreen.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    
    case main
    case recipes
    case shoppingList
    
    var id: AppScreen { self }
}

extension AppScreen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .main:
            Label("Меню", systemImage: "fork.knife")
        case .recipes:
            Label("Рецепты", systemImage: "book")
        case .shoppingList:
            Label("Покупки", systemImage: "basket")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .main:
            MainNavigation()
        case .recipes:
            RecipesNavigation()
        case .shoppingList:
            MainNavigation()
        }
    }
}
