//
//  WeekStore.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

final class WeekViewModel: ObservableObject {
    
    var selectedDate: Date = DateConverter.dateOnly(Date())
    @Published var currentDate: Date = Date()
    @Published var weeks: [DayModel] = []

    init() {
        fetchCurrentWeek()
        fetchPreviousNextWeek()
    }

    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
        
    func dateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
    
    func fetchCurrentWeek() {
        var calendar = Calendar.current
        calendar.firstWeekday = 2

        guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate)) else { return }
        
        (0..<7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek) {
                weeks.append(DayModel(id: UUID().uuidString, date: weekday))
//                currentWeek.append(weekday)
            }
        }
    }
    
    func fetchPreviousNextWeek() {
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
