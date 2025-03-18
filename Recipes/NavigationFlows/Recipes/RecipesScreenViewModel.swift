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
    @Published var recipes: [Recipe] = []
    
    private let dataStore: SwiftDataService
    
    var cancellables: Set<AnyCancellable> = []
    
    @MainActor
    init(dataStore: SwiftDataService) {
        self.dataStore = dataStore
        
        recipes = dataStore.fetchData(model: Recipe.self)
//        $recipes
//            .sink { value in
//                
////                print("value", value[0])
////                value.
////                dataStore.saveData(value)
//                
//                print(value)
//            }
//            .store(in: &cancellables)
//        
//        
    }
}
