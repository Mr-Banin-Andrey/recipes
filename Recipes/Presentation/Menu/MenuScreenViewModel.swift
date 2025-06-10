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
    
    @Published var recipes: [Recipe] = Recipe.fourRecipe // []
    private var dishLists: [DishList] = []
    private var today: Date = DateConverter.dateOnly(Date())

    @Published var id: String = UUID().uuidString
    @Published var date: Date = DateConverter.dateOnly(Date())
    @Published var mealTime: [DiningTime] = [
        DiningTime(id: UUID().uuidString, mealTimeType: .breakfast),
        DiningTime(id: UUID().uuidString, mealTimeType: .lunch),
        DiningTime(id: UUID().uuidString, mealTimeType: .afternoonSnack),
        DiningTime(id: UUID().uuidString, mealTimeType: .dinner),
    ]
        
    private var dishListForSelectedDay: DishList = DishList(
        id: "",
        date: DateConverter.dateOnly(Date()),
        mealTime: [
            DiningTime(id: UUID().uuidString, mealTimeType: .breakfast),
            DiningTime(id: UUID().uuidString, mealTimeType: .lunch),
            DiningTime(id: UUID().uuidString, mealTimeType: .afternoonSnack),
            DiningTime(id: UUID().uuidString, mealTimeType: .dinner),
        ]
    )
    
    private var cancellables: Set<AnyCancellable> = []
       
    //MARK: Initial
    @MainActor
    init() {
//        stateKeeper.$recipes
//            .sink { recipes in
//                self.recipes = recipes
//            }
//            .store(in: &cancellables)
//        
//        dishLists = database.fetchData(model: DishList.self)
//        
//        currentDate()
//
//        if let dishList = dishLists.first(where: { $0.date == today }) {
//            dishListForSelectedDay = dishList
//            id = dishList.id
//            date = dishList.date
//            mealTime = SortingData().sortingMeals(dishList.mealTime)
//        }
//                
//        $mealTime
//            .sink { mealTime in
//                if self.date == self.dishListForSelectedDay.date {
//                    self.dishListForSelectedDay.id = self.id
//                    self.dishListForSelectedDay.mealTime = mealTime
//                    
//                    if let index = self.dishLists.firstIndex(of: self.dishListForSelectedDay) {
//                        self.dishLists[index] = self.dishListForSelectedDay
//                    } else {
//                        self.dishLists.append(self.dishListForSelectedDay)
//                    }
//                    self.database.saveData(self.dishListForSelectedDay)
//                }
//            }
//            .store(in: &cancellables)
    }
   
    
    func currentDate() {
        let date = Date()
        var calendar = Calendar.current
        calendar.timeZone = .current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        if let dateOnly = calendar.date(from: dateComponents) {
            today = dateOnly
        }
    }
    
    func generateNewDay(_ selectedDate: Date) {
        let dishListDay = DishList(
            id: UUID().uuidString,
            date: DateConverter.dateOnly(selectedDate),
            mealTime: [
                DiningTime(id: UUID().uuidString, mealTimeType: .breakfast),
                DiningTime(id: UUID().uuidString, mealTimeType: .lunch),
                DiningTime(id: UUID().uuidString, mealTimeType: .afternoonSnack),
                DiningTime(id: UUID().uuidString, mealTimeType: .dinner),
            ]
        )

        dishLists.append(dishListDay)
        dishListForSelectedDay = dishListDay
    }
    
    func displayMenuForSelectedDate(_ selectedDate: Date) {
        date = DateConverter.dateOnly(selectedDate)
        
        if let dishList = self.dishLists.first(where: { $0.date == DateConverter.dateOnly(selectedDate) }) {
            id = dishList.id
            mealTime = SortingData().sortingMeals(dishList.mealTime)
        } else {
            generateNewDay(selectedDate)
            id = dishListForSelectedDay.id
            mealTime = dishListForSelectedDay.mealTime
        }
    }
}

extension Date {
    static let nowToday: Date = Date(timeIntervalSince1970: 1741986001)
}
