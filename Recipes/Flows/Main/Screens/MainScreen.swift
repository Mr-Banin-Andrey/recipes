//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import SwiftData
import Combine

struct MainScreen: View {
    
    @EnvironmentObject private var router: Router<MainRoute>
    @EnvironmentObject private var mainStore: MainStore
    
    @State private var openedViewID: String? = nil
    
    private var mealTimeItems: [MealTimeItem] = MealTimeItem.mockMealTimeItems
    
    @Query var diningTimes: [DiningTime]
//    @Query var mealTimes: [MealTimeItem]
//    @Query(
//        sort: \MealTimeItem.dateOfChange,
//        order: .reverse
//    ) private var mealTimes: [MealTimeItem]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                WeekView() { date in
                    mainStore.displayMenuForSelectedDate(date)
                }
            }
            .cornerRadius(16)
            .frame(height: 90)
            .padding(.vertical, 5)

            if let mealTimeItem = mealTimeItems.last {
                ForEach(mealTimeItem.mealTypes) { mealTime in
                    
                    MealView(
                        mealTime: mealTime,
                        selectedRecipe: nil
                    ) {
//                        router.showSheet(
//                            .showRecipeList(<#T##DiningTime#>)
//                        )
                    }
                }
            }
                     
            Spacer()
        }
        .navigationTitle("Меню на неделю")
    }
    
//    private func filterDiningTime(_ type: MealTimeType) -> DiningTime {
//        mainStore.selectedDate
        
//        if let diningTime = diningTimes.first(where: { $0.date == mainStore.selectedDate }) {
//            return diningTime
//        }
//        else {
////            return DiningTime().e
//        }
//    }
}

#Preview {
    MainScreen()
        .environmentObject(MainStore())
}
