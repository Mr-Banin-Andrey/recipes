//
//  WeekStore.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import Combine

final class WeekStore: ObservableObject {
    
    //Combine of all weeks
    @Published var allWeeks: [WeekModel] = []
    
    //Current chosen date indicator
    @Published var currentDate: Date = Date()
    
    //Index indicator
    @Published var currentIndex: Int = 0
    @Published var indexToUpdate: Int = 0
    
    //Array of Weeks
    @Published var currentWeek: [Date] = []
    @Published var nextWeek: [Date] = []
//    @Published var previousWeek: [Date] = []
    
    //Initial append of weeks
    init() {
        fetchCurrentWeek()
//        fetchPreviousNextWeek()
        appendAll()
    }
    
    func appendAll() {
        var newWeek = WeekModel(id: 0, date: currentWeek)
        allWeeks.append(newWeek)
        
        newWeek = WeekModel(id: 2, date: nextWeek)
        allWeeks.append(newWeek)
        
//        newWeek = WeekModel(id: 1, date: previousWeek)
//        allWeeks.append(newWeek)
    }
    
    func update(index: Int) {
        var value: Int = 0
        
        if index < currentIndex {
            value = 1
            if indexToUpdate == 2 {
                indexToUpdate = 0
            } else {
                indexToUpdate = indexToUpdate + 1
            }
        } else {
            value = -1
            if indexToUpdate == 0 {
                indexToUpdate = 2
            } else {
                indexToUpdate = indexToUpdate - 1
            }
        }
        
        currentIndex = index
        addWeek(index: indexToUpdate, value: value)
    }
    
    func addWeek(index: Int, value: Int) {
        allWeeks[index].date.removeAll()
        var calendar = Calendar(identifier: .gregorian)
        let today = Calendar.current.date(byAdding: .day, value: 7 * value, to: self.currentDate)
        self.currentDate = today ?? Date()
        
        calendar.firstWeekday = 1
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today ?? Date()))
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek ?? Date()) {
                allWeeks[index].date.append(weekday)
            }
        }
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
        
        
    func dateToString(date: Date,format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func fetchCurrentWeek() {
        let today = currentDate
        var calendar = Calendar(identifier: .gregorian)
    
        calendar.firstWeekday = 1
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek ?? Date()) {
                currentWeek.append(weekday)
            }
        }
    }
    
//    func fetchPreviousNextWeek() {
//        nextWeek.removeAll()
//        
//        let nextWeekToday = Calendar.current.date(byAdding: .day, value: 7, to: currentDate)
//        
//        var calendar = Calendar(identifier: .gregorian)
//        calendar.firstWeekday = 1
//        
//        let startOfWeekNext = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: nextWeekToday ?? Date()))
//        
//        (1...7).forEach{ day in
//            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekNext ?? Date()) {
//                nextWeek.append(weekday)
//            }
//        }
//        
//        previousWeek.removeAll()
//        let previousWeekToday = Calendar.current.date(byAdding: .day, value: -7, to: currentDate)
//        
//        let startOfWeekPrev = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: previousWeekToday ?? Date()))
//        
//        (1...7).forEach{ day in
//            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekPrev ?? Date()) {
//                previousWeek.append(weekday)
//            }
//        }
//    }
}
