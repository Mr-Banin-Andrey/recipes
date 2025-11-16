 //
//  ShoppingListRoute.swift
//  Recipes
//
//  Created by Андрей Банин on 16.11.2025.
//

import SwiftUI

enum ShoppingListRoute: Hashable, Identifiable {
    case emptyView
    
    var id: Self { self }
}

extension ShoppingListRoute {
    @ViewBuilder
    var destination: some View {
        switch self {
        case .emptyView:
            EmptyView()
        }
    }
}
