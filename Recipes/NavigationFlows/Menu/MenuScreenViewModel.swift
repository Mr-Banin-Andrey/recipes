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
    
    @Published var recipes: [Recipe] = []
    private var dishLists: [DishList] = []
    private var today: Date = Date.nowToday
    
    @Published var id: String = "" //UUID().uuidString
    @Published var date: Date = Date() //Date.nowToday
    @Published var mealTime: [DiningTime] = DiningTime.mockArray
    
    private var dishListForSelectedDay: DishList = DishList.mock
    
    private var cancellables: Set<AnyCancellable> = []
    
    //MARK: Initial
    
    @MainActor
    init() {
        stateKeeper.$recipes
            .sink { recipes in
                self.recipes = recipes
            }
            .store(in: &cancellables)
        
        dishLists = database.fetchData(model: DishList.self)
        
//        currentDate()

        if let dishList = dishLists.first(where: { $0.date == today }) {
            dishListForSelectedDay = dishList
            id = dishList.id
            date = dishList.date
            mealTime = SortingData().sortingMeals(dishList.mealTime)
        }
        
        $mealTime
            .sink { mealTime in
//                if !mealTime.filter({ $0.recipe != nil }).isEmpty {
                    self.dishListForSelectedDay.mealTime = mealTime
                    
                    if let index = self.dishLists.firstIndex(of: self.dishListForSelectedDay) {
                        self.dishLists[index] = self.dishListForSelectedDay
                    } else {
                        self.dishLists.append(self.dishListForSelectedDay)
                    }
                    self.database.saveData(self.dishListForSelectedDay)
//                }
            }
            .store(in: &cancellables)
    }
   
    
    func currentDate() {
        let date = Date()
        var calendar = Calendar.current
        calendar.timeZone = .current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        if let dateOnly = calendar.date(from: dateComponents) {
            today = dateOnly
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
