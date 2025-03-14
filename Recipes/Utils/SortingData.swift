//
//  SortingData.swift
//  Recipes
//
//  Created by Андрей Банин on 14.03.2025.
//

import Foundation

final class SortingData {
    
    func menuSectionSorted(recipes: [Recipe]) -> [MenuSectionType] {
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
}
