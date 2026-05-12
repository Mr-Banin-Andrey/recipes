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

    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true

    init(context: ModelContext) {
        self.context = context
        
        /// Данные даты не хранятся, каждый раз заново инициализируются
        fetchCurrentWeek()
        fetchPreviousNextWeek()
        
        createDiningTimesIfNeeded(for: selectedDate)
        if isFirstLaunch {
            createRecipesIfNeeded()
            isFirstLaunch.toggle()
        }
    }
    
    // MARK: Public
    
    /// Добавляем в хранилище приёмы пищи
    /// на конкретный день если их нет
    func createDiningTimesIfNeeded(for selectedDate: Date) {
        guard isStorageEmpty(
            of: DiningTime.self,
            predicate: #Predicate<DiningTime> { $0.date == selectedDate }
        ) else {
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
    
    /// Проверяем объекты в хранилище
    private func isStorageEmpty<T: PersistentModel>(
        of type: T.Type,
        predicate: Predicate<T>?
    ) -> Bool {
        do {
            let descriptor = FetchDescriptor<T>(
                predicate: predicate,
                sortBy: []
            )
            
            let entities = try context.fetch(descriptor)

            return entities.isEmpty
        } catch {
            print("Error fetching \(T.self): \(error)")
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
            recipe: nil
        )
        context.insert(diningTime)

        do {
            try context.save()
        } catch {
            print("Error saving diningtime context:", error)
        }
    }
    
    private func createRecipesIfNeeded() {
        guard isStorageEmpty(
            of: Recipe.self,
            predicate: nil
        ) else {
            return
        }
        
        Recipe.fourRecipe.forEach {
            addRecipeToBase($0)
        }
    }
    
    private func addRecipeToBase(_ recipe: Recipe) {
        context.insert(recipe)

        do {
            try context.save()
        } catch {
            print("Error saving recipe context:", error)
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
