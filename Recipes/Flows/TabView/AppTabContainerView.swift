//
//  AppTabContainerView.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI

struct AppTabContainerView: View {
    
    @State private var selectionTab: AppScreen = .main
    
    var body: some View {
        AppTabView(selection: $selectionTab)
            .appScreen($selectionTab)
    }
}

struct AppTabView: View {
    
    @Binding var selection: AppScreen
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
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
