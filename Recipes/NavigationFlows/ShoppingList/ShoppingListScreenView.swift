//
//  ShoppingListView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct ShoppingListScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopNavigateView(title: "Покупки")
                    .scaledToFit()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ShoppingListScreenView()
}
