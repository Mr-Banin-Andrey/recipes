//
//  MainNavigation.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI

struct MainNavigation: View {
    
    @StateObject private var router = Router<MainRoute>()
    private let mainStore: MainStore = .init()
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            MainScreen()
                .navigationDestination(for: MainRoute.self) { route in
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
        .environmentObject(mainStore)
    }
}
