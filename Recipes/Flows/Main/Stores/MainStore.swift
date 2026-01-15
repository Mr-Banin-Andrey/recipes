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
        
    /// Текущий день
    @Published var dishListForCurrentDay: DishList = .mock
//    /// Текущие время приема пищи
//    @Published var currentDiningTime: DiningTime?
    
    
    /// TODO: рецепты будут грузится напрямую из swiftdata
    /// после добавления логики, выпилить рецепты из стора
    @Published var recipes: [Recipe] = Recipe.fourRecipe
    
    /// TODO: изменить логику,
    /// массив дней должен выгружаться из swiftdata
    /// следовательно, грузить будем в файле MainScreen
    private var dishLists: [DishList] = []

    init() {
        /// Данные даты не хранятся, каждый раз заново инициализируются
        fetchCurrentWeek()
        fetchPreviousNextWeek()
        displayMenuForSelectedDate(currentDate)
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
            dishListForCurrentDay = dishList
        } else {
            generateNewDay(selectedDate)
        }
    }
    
    /// Передать выбранный приём пищи
    func selectMealTime() {
        
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
        dishListForCurrentDay = dishListDay
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
