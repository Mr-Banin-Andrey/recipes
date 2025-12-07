//
//  WeekView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct WeekView: View {
    
    private var currentDate: Date = Date()
    @State private var selectedDate: Date = DateConverter.dateOnly(Date())
    @State private var weeks: [DayModel] = []
    private let onDayTap: (Date) -> Void

    init(onDayTap: @escaping (Date) -> Void) {
        self.onDayTap = onDayTap
        
        /// Данные даты не хранятся, каждый раз заново инициализируются
        self.fetchCurrentWeek()
        self.fetchPreviousNextWeek()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(weeks) { day in
                        VStack {
                            Text(convertDateToString(
                                date: day.date,
                                format: "EEE"
                            ))
                            .foregroundStyle(.mainText)
                            .padding(.top, 5)
                            .font(.system(size: 15, weight: .regular))
                            
                            Text(convertDateToString(
                                date: day.date,
                                format: "d"
                            ))
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.mainText)
                            .padding(10)
                            .background(selectedDate == DateConverter.dateOnly(day.date)
                                        ? .frostFairy
                                        : .clear)
                            .clipShape(.rect(cornerRadius: 100))
                        }
                        .frame(
                            width: abs(geometry.size.width / 7),
                            height: 85
                        )
                        .onTapGesture {
                            self.selectedDate = DateConverter.dateOnly(day.date)
                            self.onDayTap(day.date)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .padding(.vertical, 5)
    }
    
    private func convertDateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
    
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

#Preview {
    WeekView() { _ in print("123") }
}
