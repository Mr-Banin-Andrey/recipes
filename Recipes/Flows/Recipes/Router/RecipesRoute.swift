//
//  RecipesRoute.swift
//  Recipes
//
//  Created by Андрей Банин on 12.11.2025.
//

import SwiftUI

enum RecipesRoute: Hashable, Identifiable {
    case createAndEditRecipe
    
    var id: Self { self }
}

extension RecipesRoute {
    @ViewBuilder
    var destination: some View {
        switch self {
        case .createAndEditRecipe:
            EmptyView()
        }
    }
}
