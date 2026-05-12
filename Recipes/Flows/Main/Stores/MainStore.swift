//
//  MainStore.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI
import Combine
import SwiftData

final class MainStore: ObservableObject {
    
    private let context: ModelContext
    
    // Calendar
    @Published var weeks: [DayModel] = []
    @Published var selectedDate: Date = DateConverter.dateOnly(Date())
    private var currentDate: Date = Date()

    @Published var recipes: [Recipe] = Recipe.fourRecipe

    init(context: ModelContext) {
        self.context = context
        
        /// Данные даты не хранятся, каждый раз заново инициализируются
        fetchCurrentWeek()
        fetchPreviousNextWeek()
        
        diningTimeAdd(selectedDate)
    }
    
    // MARK: Public
    
    /// Добавляем в хранилище приёмы пищи на конкретный день
    func diningTimeAdd(_ selectedDate: Date) {
        guard hasDiningTimes(selectedDate) else {
            self.selectedDate = selectedDate
            return
        }
        
        [
            .breakfast,
            .lunch,
            .dinner
        ].forEach { mealTimeType in
            addDiningTime(selectedDate, mealTimeType: mealTimeType)
        }
    }
    
    // MARK: Private
    
    /// Проверяем в хранилище приёмы пищи на выбранный день
    private func hasDiningTimes(_ selectedDate: Date) -> Bool {
        do {
            let descriptor = FetchDescriptor<DiningTime>(
                predicate: #Predicate { $0.date == selectedDate },
                sortBy: []
            )
            
            let diningTimes = try context.fetch(descriptor)

            return diningTimes.isEmpty
        } catch {
            print("Error hasDiningTimes")
            return false
        }
    }
    
    /// Создание приема пищи и добавление в хранилище
    private func addDiningTime(
        _ selectedDate: Date,
        mealTimeType: MealTimeType
    ) {
        let diningTime = DiningTime(
            id: UUID().uuidString,
            date: selectedDate,
            mealTimeType: mealTimeType,
            recipe: .emptyRecipe
        )
        context.insert(diningTime)

        do {
            try context.save()
        } catch {
            print("Error saving context:", error)
        }
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
