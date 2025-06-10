//
//  RecipesScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import SwiftUI
import SwiftData
import Combine

final class RecipesScreenViewModel: ObservableObject {
        
    @Published var mealType: MenuSectionType = .breakfasts
    @Published var mealTypes: [MenuSectionType] = []
    @Published var recipes: [Recipe] = Recipe.fourRecipe // []
    
    @Dependency var stateKeeper: StateKeeper
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
//        stateKeeper.$recipes
//            .sink { value in
//                self.recipes = value
//            }
//            .store(in: &cancellables)
    }
    
    func getIndex(of recipe: Recipe) -> Int {
        let recipesFilter = recipes.filter { $0.meal == mealType }
        guard let index = recipesFilter.firstIndex(of: recipe) else {
            return 0
        }
        return index
    }
}
