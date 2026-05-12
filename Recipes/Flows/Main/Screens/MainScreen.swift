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
    @Environment(\.modelContext) private var modelContext
    
    @State private var openedViewID: String? = nil
    
    private var mealTimeItems: [MealTimeItem] = MealTimeItem.mockMealTimeItems
    
    @Query var diningTimes: [DiningTime]
    @Query var mealTimes: [MealTimeItem]
    @Query var recipes: [Recipe]
//    @Query(
//        sort: \MealTimeItem.dateOfChange,
//        order: .reverse
//    ) private var mealTimes: [MealTimeItem]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                WeekView() { date in
                    mainStore.diningTimeAdd(date)
                }
            }
            .cornerRadius(16)
            .frame(height: 90)
            .padding(.vertical, 5)

            /// для большого кол-ва приемов
            /// попробовать через switch
            
            ForEach(
                diningTimes.filter(
                    {
                        $0.date == mainStore.selectedDate
                    }
                )
            ) { diningTime in
                MealView(
                    mealTime: diningTime.mealTimeType,
                    selectedRecipe: diningTime.recipe
                ) {
                    router.showSheet(
                        .showRecipeList(diningTime)
                    )
                }
            }
            
            Spacer()
        }
        .navigationTitle("Меню на неделю")
    }
}
//
//#Preview {
//    MainScreen()
//        .environmentObject(MainStore())
//}
