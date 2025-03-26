//
//  SortingData.swift
//  Recipes
//
//  Created by Андрей Банин on 14.03.2025.
//

import Foundation

final class SortingData {
    
    func sortingMenuSections(recipes: [Recipe]) -> [MenuSectionType] {
        let mealTypes = Array(Set(recipes.map { $0.meal }))
        
        let sortedTasks = mealTypes.sorted { firstType, secondType in
            guard
                let index1 = MenuSectionType.allCases.firstIndex(of: firstType),
                let index2 = MenuSectionType.allCases.firstIndex(of: secondType)
            else { return false }
            return index1 < index2
        }
        
        return sortedTasks
    }
    
    func sortingMeals(_ mealTime: [DiningTime]) -> [DiningTime] {
        let sortedMeals = mealTime.sorted {
            guard
                let firstIndex = MealTimeType.allCases.firstIndex(of: $0.mealTimeType),
                let secondIndex = MealTimeType.allCases.firstIndex(of: $1.mealTimeType)
            else { return false }
            return firstIndex < secondIndex
        }
        
        return sortedMeals
    }
    
    func sortingMeals(_ dishList: DishList) -> DishList {
        let sortedMeals = dishList.mealTime.sorted {
            guard
                let firstIndex = MealTimeType.allCases.firstIndex(of: $0.mealTimeType),
                let secondIndex = MealTimeType.allCases.firstIndex(of: $1.mealTimeType)
            else { return false }
            return firstIndex < secondIndex
        }
        
        return DishList.init(id: dishList.id, date: dishList.date, mealTime: sortedMeals)
    }
}
