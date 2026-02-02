//
//  MainRoute.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI

enum MainRoute: Hashable, Identifiable {
    case showRecipeList(DiningTime)
    
    var id: Self { self }
}


extension MainRoute {
    @ViewBuilder
    var destination: some View {
        switch self {
        case .showRecipeList(let diningTime):
            RecipeListSheet(diningTime: diningTime)
        }
    }
}
