//
//  MenuScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 14.03.2025.
//

import SwiftUI

final class MenuScreenViewModel: ObservableObject {
    
    @Published var dishList: [TheDishList] = [TheDishList(
        id: UUID().uuidString,
        date: Date.nowToday,
        mealTime: [
            DiningTime(
                id: UUID().uuidString,
                mealTimeType: .breakfast,
                recipe: Recipe.mockRecipe
            ),
            DiningTime(
                id: UUID().uuidString,
                mealTimeType: .lunch,
                recipe: Recipe.mockRecipe
            ),
            DiningTime(
                id: UUID().uuidString,
                mealTimeType: .afternoonSnack,
                recipe: Recipe.mockRecipe
            ),
            DiningTime(
                id: UUID().uuidString,
                mealTimeType: .dinner,
                recipe: Recipe.mockRecipe
            )
        ])
    ]
    
    @Published var date: Date = Date.nowToday
    @Published var mealTime: [MealTimeType] = MealTimeType.mockMealTime
    
    @Published var isOpenMealTime: [Bool] = [false, false, false, false]
    
    //TODO: выбранное блюдо дожно быть в отдельном представлении/массиве
    @Published var selectedRecipe: Recipe = .mockRecipe
//    
//    func filterDishListByDate(_ date: Date) -> TheDishList {
//        return viewModel.dishList.filter({ $0.date == viewModel.date })[0]
//    }
    
    
}

extension Date {
    static let nowToday: Date = Date(timeIntervalSince1970: 1741986001)
}
