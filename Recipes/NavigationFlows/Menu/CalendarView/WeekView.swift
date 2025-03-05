//
//  WeekView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct WeekView: View {
    @StateObject var viewModel = WeekViewModel()
    var onDayTap: (Date) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(viewModel.weeks) { day in
                        VStack {
                            Text(viewModel.dateToString(date: day.date, format: "EEE"))
                            
                            Text(viewModel.dateToString(date: day.date, format: "d"))
                                .font(.system(size: 20))
                                .padding(10)
                                .background(viewModel.isToday(date:
                                                                day.date) ? Circle().fill(Color.indigo.opacity(0.3)) : Circle().fill(Color.clear.opacity(0.5)))
                        }
                        .frame(width: (geometry.size.width - 50) / 7)
                        .onTapGesture {
                            onDayTap(day.date)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .padding(5)
        .frame(height: 75)
        .padding(5)
    }
}

#Preview {
    WeekView(onDayTap: { _ in print("123") })
}
