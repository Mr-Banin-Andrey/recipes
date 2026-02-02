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
    
    @Query var diningTimes: [DiningTime]
    
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
            // TODO: поменял на массив
            // может быть переписать, на подумать
            // оставлю предыдущий вариант
            
            // TODO: - второй вариант старт
            // сделать отдельно логику полей завтрак/обед/ужин
            // по дате и типу приема из массива добавлять рецепты
            // а структуру полей положить например в юзер дефолт
            // и там менять, если нужно больше полей, и это можно будет сделать уже в след обновлении
            // TODO: - второй вариант конец
            
//            if let day = $mainStore.dishLists.first(
//                where: { $0.date.wrappedValue == mainStore.selectedDate }
//            ) {
//                ForEach(day.mealTime) { mealTime in
//                    MealView(
//                        selectedRecipe: mealTime.recipe,
//                        id: mealTime.id,
//                        nameMealTime: mealTime.mealTimeType.wrappedValue.localizedDescription
//                    ) {
//                        router.showSheet(
//                            .showRecipeList(mealTime.mealTimeType.wrappedValue)
//                        )
//                    }
//                    .padding(.top, 12)
//                }
//            }
            
//            ForEach(
////                $mainStore.dishListForCurrentDay.mealTime
//                $mainStore.dishLists.first(where: { $0.date == $mainStore.currentDate })
//            ) { mealTime in
//                MealView(
//                    selectedRecipe: mealTime.recipe,
//                    id: mealTime.id,
//                    nameMealTime: mealTime.mealTimeType.wrappedValue.localizedDescription
//                ) {
//                    router.showSheet(.showRecipeList(mealTime.mealTimeType.wrappedValue))
//                }
//                .padding(.top, 12)
//            }
            
            Spacer()
        }
        .navigationTitle("Меню на неделю")
    }
}

#Preview {
    MainScreen()
        .environmentObject(MainStore())
}
