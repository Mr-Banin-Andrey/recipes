//
//  WeekView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct WeekView: View {
    
    @EnvironmentObject private var store: MainStore
    var onDayTap: (Date) -> Void

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(store.weeks) { day in
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
                            .background(store.selectedDate == DateConverter.dateOnly(day.date)
                                        ? .frostFairy
                                        : .clear)
                            .clipShape(.rect(cornerRadius: 100))
                        }
                        .frame(
                            width: abs(geometry.size.width / 7),
                            height: 85
                        )
                        .onTapGesture {
                            store.selectedDate = DateConverter.dateOnly(day.date)
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
}

#Preview {
    WeekView() { _ in print("123") }
}
