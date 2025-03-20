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
    
    @Published var recipes: [Recipe] = []
    @Published var dishListForSelectedDay: DishList = DishList.mock
    @Published var date: Date = Date.nowToday
    
    @Dependency var stateKeeper: StateKeeper
    @Dependency var database: SwiftDataService
    
    private var cancellables: Set<AnyCancellable> = []
    
    @MainActor
    init() {
        stateKeeper.$recipes
            .sink { recipes in
                self.recipes = recipes
            }
            .store(in: &cancellables)
                
        $dishListForSelectedDay
            .sink { value in
                //TODO: отрефачить, некоректно отображается
                if let index = self.stateKeeper.dishLists.firstIndex(where: { $0.id == value.id }) {
                    self.stateKeeper.dishLists[index] = value
                    self.database.saveData(value)
//                    print("🐸",value.date, value.id, value.mealTime)
////                    value.mealTime.forEach { print($0.mealTimeType) }
                } else {
                    self.stateKeeper.dishLists.append(value)
                    self.database.saveData(value)
                }
            }
            .store(in: &cancellables)
    }
   
    
    func currentDate() {
        let date = Date()
        var calendar = Calendar.current
        calendar.timeZone = .current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        if let dateOnly = calendar.date(from: dateComponents) {
            print(dateOnly)
        }
    }
    
    func downloadDataForSelectedDay(date: Date) {
        if let index = stateKeeper.dishLists.firstIndex(where: { $0.date == date }) {
            dishListForSelectedDay = stateKeeper.dishLists[index]
        }
//        else {
//            //TODO: добавить день с приемами пищи
//        }
    }
    
    //TODO: добавление TheDishList в массив при нажатии на дату
    //если нет даты, создать, есть ничего не делать (перейти)
    func addMealTime(_ mealTimeType: MealTimeType) {}
}

extension Date {
    static let nowToday: Date = Date(timeIntervalSince1970: 1741986001)
}

//final class DishList {
//    @Attribute(.unique)
//    var id: String
//    var date: Date
//    var mealTime: [DiningTime]

//final class DiningTime {
//    @Attribute(.unique)
//    var id: String
//    var mealTimeType: MealTimeType
//    var recipe: Recipe
