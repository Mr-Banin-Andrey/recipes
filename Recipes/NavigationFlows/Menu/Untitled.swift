//import SwiftUI
////import UIKit
////import Foundation
//struct ContentView: View {
//    @State private var currentDate = Date()
//    @State private var selectedDate: Set<DateComponents> = []
//
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: { previousWeek() }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title)
//                }
//                
//                Text(currentDate, style: .date)
//                    .font(.headline)
//                    .onTapGesture {
//                        showMonthPicker()
//                    }
//                
//                Button(action: { nextWeek() }) {
//                    Image(systemName: "chevron.right")
//                        .font(.title)
//                }
//            }
//            .padding()
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(alignment: .center, spacing: 20) {
//                    ForEach(weeksInRange(), id: \.self) { week in
//                        WeekTwoView(week: week, selectedDate: $selectedDate)
//                            .id(week)
//                            .frame(width: UIScreen.main.bounds.width - 40)
//                    }
//                }
//                .scrollTargetLayout()
//            }
//            .scrollTargetBehavior(.paging)
//            .scrollPosition(id: currentDate.startOfWeek())
//        }
//    }
//
//    func weeksInRange() -> [Date] {
//        let calendar = Calendar.current
//        let startDate = calendar.date(byAdding: .weekOfYear, value: -1, to: currentDate)!
//        let endDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentDate)!
//        return (0...2).compactMap { calendar.date(byAdding: .weekOfYear, value: $0, to: startDate) }
//    }
//
//    func previousWeek() {
//        currentDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: currentDate)!
//    }
//
//    func nextWeek() {
//        currentDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: currentDate)!
//    }
//
//    func showMonthPicker() {
//        let dateRange = DateInterval(start: Calendar.current.date(from: DateComponents(year: 2000))!, end: Calendar.current.date(from: DateComponents(year: 2100))!)
//        let config = DatePicker.DatePickerComponents(yearAndMonth)
//        let datePicker = UIDatePicker(datePickerMode: .date, dateRange: dateRange, configuration: config)
//        datePicker.preferredDatePickerStyle = .inline
//
//        let alertController = UIAlertController(title: "Выберите дату", message: nil, preferredStyle: .alert)
//        alertController.view.addSubview(datePicker)
//
//        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
//        alertController.addAction(UIAlertAction(title: "Готово", style: .default) { _ in
//            currentDate = datePicker.date
//        })
//
//        UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true)
//    }
//}
//
//struct WeekTwoView: View {
//    let week: Date
//    @Binding var selectedDate: Set<DateComponents>
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack(spacing: 20) {
//                ForEach(daysOfWeek(), id: \.self) { day in
//                    Text(day)
//                        .font(.caption)
//                        .foregroundColor(.secondary)
//                }
//            }
//
//            HStack(spacing: 20) {
//                ForEach(datesInWeek(), id: \.self) { date in
//                    DateCell(date: date, selectedDate: $selectedDate)
//                }
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(16)
//        .shadow(radius: 4)
//    }
//
//    func daysOfWeek() -> [String] {
//        ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
//    }
//
//    func datesInWeek() -> [Date] {
//        let calendar = Calendar.current
//        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: week))!
//        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
//    }
//}
//
//struct DateCell: View {
//    let date: Date
//    @Binding var selectedDate: Set<DateComponents>
//
//    var body: some View {
//        let calendar = Calendar.current
//        let day = calendar.component(.day, from: date)
//        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
//
//        return Button(action: {
//            if selectedDate.contains(dateComponents) {
//                selectedDate.remove(dateComponents)
//            } else {
//                selectedDate.insert(dateComponents)
//            }
//        }) {
//            Text("\(day)")
//                .frame(width: 36, height: 36)
//                .background(selectedDate.contains(dateComponents) ? Color.blue : Color.clear)
//                .foregroundColor(selectedDate.contains(dateComponents) ? Color.white : Color.black)
//                .cornerRadius(18)
//        }
//    }
//}
//
//extension Date {
//    func startOfWeek() -> Date {
//        return Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
//    }
//}
////
//////@main
//////struct CalendarApp: App {
//////    var body: some Scene {
//////        WindowGroup {
//////            ContentView()
//////        }
//////    }
//////}
