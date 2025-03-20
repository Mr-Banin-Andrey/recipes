//
//  MenuScreenViewModel.swift
//  Recipes
//
//  Created by Андрей Банин on 14.03.2025.
//

import SwiftUI
import Combine
import SwiftData


final class MenuScreenViewModel: ObservableObject {
    
    @Published var dishLists: [DishList] = [DishList(
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
    
    @Published var dishListForSelectedDay: DishList = DishList(
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
    
    @Published var date: Date = Date.nowToday
        
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        $dishListForSelectedDay
            .sink { value in
                print(value)
            }
            .store(in: &cancellables)
    }
    
    //TODO: добавление TheDishList в массив при нажатии на дату
    //если нет даты, создать, есть ничего не делать (перейти)
    func addMealTime(_ mealTimeType: MealTimeType) {}
}

extension Date {
    static let nowToday: Date = Date(timeIntervalSince1970: 1741986001)
}
