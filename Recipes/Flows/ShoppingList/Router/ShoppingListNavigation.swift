//
//  ShoppingListNavigation.swift
//  Recipes
//
//  Created by Андрей Банин on 16.11.2025.
//

import SwiftUI

struct ShoppingListNavigation: View {
    
    @StateObject private var router = Router<ShoppingListRoute>()
    private let shoppingListStore: ShoppingListStore = .init()
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            ShoppingListScreen()
                .navigationDestination(for: ShoppingListRoute.self) { route in
                    route.destination
                }
                .sheet(
                    item: $router.sheet,
                    onDismiss: router.onSheetDismiss
                ) { sheet in
                    NavigationStack {
                        sheet.destination
                    }
                }
        }
        .environmentObject(router)
        .environmentObject(shoppingListStore)
    }
}
