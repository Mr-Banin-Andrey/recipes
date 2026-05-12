//
//  AppTabContainerView.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI
import SwiftData

struct AppTabContainerView: View {
    
    @State private var selectionTab: AppScreen = .main
    
    var body: some View {
        AppTabView(selection: $selectionTab)
            .appScreen($selectionTab)
    }
}

struct AppTabView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Binding var selection: AppScreen
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination(context: modelContext)
                    .tag(screen)
                    .tabItem {
                        screen.label
                    }
            }
        }
    }
}

#Preview {
    AppTabContainerView()
}
