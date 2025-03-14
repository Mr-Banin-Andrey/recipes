//
//  RecipesScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 13.03.2025.
//

import SwiftUI
import SwiftData

final class RecipesScreenViewModel: ObservableObject {
    
    @Published var mealType: MenuSectionType = .breakfasts
    @Published var mealTypes: [MenuSectionType] = []
}
