//
//  WeekView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct WeekView: View {
    @StateObject var viewModel: WeekViewModel
    var onDayTap: (Date) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(viewModel.weeks) { day in
                        VStack {
                            Text(viewModel.convertDateToString(
                                date: day.date,
                                format: "EEE"
                            ))
                            .foregroundStyle(.mainText)
                            .padding(.top, 5)
                            .font(.system(size: 15, weight: .regular))
                            
                            Text(viewModel.convertDateToString(
                                date: day.date,
                                format: "d"
                            ))
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.mainText)
                            .padding(10)
                            .background(viewModel.selectedDate == DateConverter.dateOnly(day.date)
                                        ? .frostFairy
                                        : .clear)
                            .clipShape(.rect(cornerRadius: 100))
                        }
                        .frame(width: abs(geometry.size.width / 7), height: 85)
                        .onTapGesture {
                            viewModel.selectedDate = DateConverter.dateOnly(day.date)
                            onDayTap(day.date)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    WeekView(viewModel: WeekViewModel(), onDayTap: { _ in print("123") })
}
