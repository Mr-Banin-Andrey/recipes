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
    
    //MARK: Global Dependency
    @Dependency var stateKeeper: StateKeeper
    @Dependency var database: SwiftDataService
    
    //day
    @Published var id: String = UUID().uuidString
    @Published var date: Date = Date.nowToday
    
    @Published var mealTime: [DiningTime] = DiningTime.mockArray
    @Published var mealTimeForSave: [DiningTime] = []
    
    //all recipe & day in model
    @Published var recipes: [Recipe] = []
//    @Published var dishListForSelectedDay: DishList = DishList.mock
    
    private var cancellables: Set<AnyCancellable> = []
    
    //MARK: Initial
    
    @MainActor
    init() {
        stateKeeper.$recipes
            .sink { recipes in
                self.recipes = recipes
            }
            .store(in: &cancellables)
                
//        $dishListForSelectedDay
//            .sink { value in
//                //TODO: отрефачить, некоректно отображается
//                if let index = self.stateKeeper.dishLists.firstIndex(where: { $0.id == value.id }) {
//                    self.stateKeeper.dishLists[index] = value
//                    self.database.saveData(value)
////                    print("🐸",value.date, value.id, value.mealTime)
//////                    value.mealTime.forEach { print($0.mealTimeType) }
//                } else {
//                    self.stateKeeper.dishLists.append(value)
//                    self.database.saveData(value)
//                }
//            }
//            .store(in: &cancellables)
        
//        stateKeeper.$dishLists
//            .sink { dishLists in
//                print(" stateKeepe dishLists.count 💙 \(dishLists.count)")
//                print(" stateKeeper.$dishLists 💙1")
//                if let index = dishLists.firstIndex(where: { $0.date == self.date }) {
//                    print(" stateKeeper.$dishLists 💙2")
//                    let dishList = dishLists[index]
//                    print(" stateKeeper.$dishLists 💙3")
//                    self.id = dishLists[index].id
//                    print(" stateKeeper.$dishLists 💙4")
//                    dishList.mealTime.forEach { meal in
//                        print(" stateKeeper.$dishLists 💙5")
//                        if let mealTimeIndex = self.mealTime.firstIndex(where: { $0.mealTimeType == meal.mealTimeType }) {
//                            print(" stateKeeper.$dishLists 💙6")
//                            self.mealTime[mealTimeIndex].recipe = meal.recipe
//                            print(" stateKeeper.$dishLists 💙7")
//                        }
//                    }
//                }
//                print("stateKeeper.$dishLists 💙-------------------------------")
//            }
//            .store(in: &cancellables)
        
        $mealTime
            .map { $0 }
            .sink { mealTime in
                
//                if !self.stateKeeper.dishLists.filter({ $0.date == self.date }).isEmpty {
//
//                }
//                print("$mealTime 🐸1")
//                //фильтрует данные по заполненым рецептам
//                let filledRecipe = mealTime.filter { $0.recipe.name != "" }
//                print("$mealTime 🐸2")
//                
//                
//                //инициализируем рецепты на день
//                let dishList = DishList(id: self.id, date: self.date, mealTime: filledRecipe)
//                print("$mealTime 🐸3")
//                
//                
//                //добавляем в массив и базу
//                if let index = self.stateKeeper.dishLists.firstIndex(where: { $0.id == self.id }) {
//                    print("$mealTime 🐸4")
//                    self.stateKeeper.dishLists[index] = dishList
//                } else {
//                    print("$mealTime 🐸5")
//                    self.stateKeeper.dishLists.append(dishList)
//                }
//                print("$mealTime 🐸6")
//                self.database.saveData(dishList)
//                print("$mealTime 🐸-------------------------------")
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
//        if let index = stateKeeper.dishLists.firstIndex(where: { $0.date == date }) {
//            dishListForSelectedDay = stateKeeper.dishLists[index]
//        }
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
