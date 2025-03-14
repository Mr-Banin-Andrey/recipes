//
//  MenuScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 14.03.2025.
//

import SwiftUI

final class MenuScreenViewModel: ObservableObject {
    
//    @Published var dishList: [TheDishList] = [TheDishList(
//        id: UUID().uuidString,
//        date: Date(),
//        mealTime: [
//            DiningTime(
//                id: UUID().uuidString,
//                mealTimeType: .breakfast,
//                recipe: <#T##Recipe#>
//            )
//        ])
//    ]
    
    @Published var date: Date = Date()
    @Published var mealTime: [MealTimeType] = [.breakfast, .lunch, .afternoonSnack, .dinner]
    
//    @Published var menuSections: [MenuSectionType] = 
    
    //TODO: выбранное блюдо дожно быть в отдельном представлении/массиве
    @Published var selectedRecipe: Recipe = .mockRecipe
    
}
