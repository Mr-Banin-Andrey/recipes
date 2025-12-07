//
//  MainStore.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI
import Combine

final class MainStore: ObservableObject {
    
    // Calendar
    @Published var weeks: [DayModel] = []
    @Published var selectedDate: Date = DateConverter.dateOnly(Date())
    private var currentDate: Date = Date()
    
    @Published var recipes: [Recipe] = Recipe.fourRecipe
    private var dishLists: [DishList] = []
    private var today: Date = DateConverter.dateOnly(Date())

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
    
    @Published var currentDiningTime: DiningTime?
    @Published var currentMeal: MenuSectionType = .breakfasts
    
//    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        /// Данные даты не хранятся, каждый раз заново инициализируются
        fetchCurrentWeek()
        fetchPreviousNextWeek()
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
    
//    private func currentDate() {
//        let date = Date()
//        var calendar = Calendar.current
//        calendar.timeZone = .current
//        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
//        if let dateOnly = calendar.date(from: dateComponents) {
//            today = dateOnly
//        }
//    }
        
    /// Ищем по массиву текущий день
    /// и кладём для отображения на экране в mealTime
    func displayMenuForSelectedDate(_ selectedDate: Date) {
        if let dishList = self.dishLists.first(where: { $0.date == DateConverter.dateOnly(selectedDate) }) {
            mealTime = dishList.mealTime
        } else {
            generateNewDay(selectedDate)
        }
    }
    
    private func generateNewDay(_ selectedDate: Date) {
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
    
    // Calendar
    private func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
    
    /// Создаёт и добавляет текущую неделю в массив
    private func fetchCurrentWeek() {
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        
        guard let startOfWeek = calendar.date(from: calendar.dateComponents([ .yearForWeekOfYear, .weekOfYear], from: currentDate)) else { return }
        
        (0..<7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek) {
                weeks.append(DayModel(id: UUID().uuidString, date: weekday))
                //                currentWeek.append(weekday)
            }
        }
    }
    
    /// Создаёт и добавляет следующую неделю в массив
    private func fetchPreviousNextWeek() {
        guard let nextWeekToday = Calendar.current.date(byAdding: .day, value: 7, to: currentDate) else { return }
        
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        
        guard let startOfWeekNext = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: nextWeekToday)) else { return }
        
        (0..<7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekNext) {
                weeks.append(DayModel(id: UUID().uuidString, date: weekday))
                //                currentWeek.append(weekday)
            }
        }
    }
}
