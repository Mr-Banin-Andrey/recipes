//
//  RecipesNavigation.swift
//  Recipes
//
//  Created by Андрей Банин on 12.11.2025.
//

import SwiftUI
import SwiftData

struct RecipesNavigation: View {
    
    @StateObject private var router = Router<RecipesRoute>()
    private let modelContext: ModelContext
    private let recipesStore: RecipesStore
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        recipesStore = .init(context: modelContext)
    }
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            RecipesScreen()
                .navigationDestination(for: RecipesRoute.self) { route in
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
        .environmentObject(recipesStore)
    }
}
