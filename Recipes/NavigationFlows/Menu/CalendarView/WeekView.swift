//
//  WeekView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

//struct WeekView: View {
//    @StateObject var weekStore = WeekStore()
//    @State private var snappedItem = 0.0
//    @State private var draggingItem = 0.0
//
//    var body: some View {
//        ZStack {
//            ForEach(weekStore.allWeeks) { week in
//                VStack {
//                    HStack {
//                        ForEach(0..<7) { index in
//                            VStack(spacing: 20) {
//                                Text(weekStore.dateToString(date: week.date[index], format: "EEE"))
//                                    .font(.system(size: 14))
//                                    .fontWeight(.semibold)
//                                    .frame(maxWidth: .infinity)
//                                Text(weekStore.dateToString(date: week.date[index], format: "d"))
//                                    .font(.system(size: 14))
//                                    .frame(maxWidth: .infinity)
//                            }
//                            .onTapGesture {
//                                // Updating Current Day
//                                weekStore.currentDate = week.date[index]
//                            }
//                        }
//                    }
//                    .frame(width: UIScreen.main.bounds.width)
//                    .background(
//                        Rectangle()
//                            .fill(.white)
//                    )
//                }
////                .offset(x: myXOffset(week.id), y: 0)
////                .zIndex(1.0 - abs(distance(week.id)) * 0.1)
//                .padding(.horizontal, 20)
//            }
//        }
//        .padding(.vertical, 10)
//
//        .frame(maxHeight: .infinity , alignment : .top)
////        .gesture(
////            DragGesture()
////                .onChanged { value in
////                    draggingItem = snappedItem + value.translation.width / 400
////                }
////                .onEnded { value in
////                    withAnimation {
////                        if value.predictedEndTranslation.width > 0 {
////                            
////                        } else {
////                            draggingItem = snappedItem - 1
////                        }
////                        snappedItem = draggingItem
////                        weekStore.update(index: Int(snappedItem))
////                    }
////                }
////        )
//    }
////    
////    func distance(_ item: Int) -> Double {
////        return (draggingItem - Double(item)).remainder(dividingBy: Double(weekStore.allWeeks.count))
////    }
////    
////    func myXOffset(_ item: Int) -> Double {
////        let angle = Double.pi * 2 / Double(weekStore.allWeeks.count) * distance(item)
////        return sin(angle) * 200
////    }
//}

struct WeekView: View {
    
    private var days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    private var currentWeek: [Date] = []
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 20) {
                    ForEach(0..<7) { index in
                        VStack(spacing: 20) {
                            Text(dateToString(date: currentWeek[index], format: "EEE"))
                                .font(.system(size: 20))
                        
                            Text(dateToString(date: currentWeek[index], format: "d"))
                            .font(.system(size: 20))
                    //                                Text(weekStore.dateToString(date: week.date[index], format: "EEE"))
                    //                                    .font(.system(size: 14))
                    //                                    .fontWeight(.semibold)
                    //                                    .frame(maxWidth: .infinity)
                    //                                Text(weekStore.dateToString(date: week.date[index], format: "d"))
                    //                                    .font(.system(size: 14))
                    //                                    .frame(maxWidth: .infinity)
                    //                            }
                    //                            .onTapGesture {
                    //                                // Updating Current Day
                    //                                weekStore.currentDate = week.date[index]
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
        .padding(20)
    }
    
    mutating func fetchCurrentWeek() {
        let today = Date()
        var calendar = Calendar(identifier: .gregorian)
    
        calendar.firstWeekday = 1
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek ?? Date()) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func dateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

#Preview {
    WeekView()
}
