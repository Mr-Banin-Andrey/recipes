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
                            Text(viewModel.dateToString(date: day.date, format: "EEE"))
                                .foregroundStyle(.mainText)
                                .padding(.top, 5)
                            
                            Text(viewModel.dateToString(date: day.date, format: "d"))
                                .font(.system(size: 20))
                                .foregroundStyle(.mainText)
                                .padding(10)
                        }
                        
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.selectedDate == DateConverter.dateOnly(day.date) ? Color.navBar : Color.clear, lineWidth: 1))
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
