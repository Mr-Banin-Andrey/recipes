//
//  RecipesScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import SwiftUI
import SwiftData

final class RecipesScreenViewModel: ObservableObject {
    
    @Published var mealType: MealType = .breakfast
    @Published var mealTypes: [MealType] = []
    
    func fetchMealTypes(recipes: [Recipe]) -> [MealType] {
        let mealTypes = Array(Set(recipes.map { $0.meal }))
        
        let sortedTasks = mealTypes.sorted { firstType, secondType in
            guard
                let index1 = MealType.allCases.firstIndex(of: firstType),
                let index2 = MealType.allCases.firstIndex(of: secondType)
            else { return false }
            return index1 < index2
        }
        
        return sortedTasks
    }
}
