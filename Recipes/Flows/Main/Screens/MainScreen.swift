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
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                WeekView(viewModel: WeekViewModel()) { date in
                    mainStore.displayMenuForSelectedDate(date)
                }
            }
            .cornerRadius(16)
            .frame(height: 90)
            .padding(.vertical, 5)
            
            ScrollView(.vertical) {
                ForEach($mainStore.mealTime) { mealTime in
                    MealView(
                        selectedRecipe: mealTime.recipe,
                        id: mealTime.id,
                        nameMealTime: mealTime.mealTimeType.wrappedValue.localizedDescription
                    ) {
                        mainStore.currentDiningTime = mealTime.wrappedValue
                        router.showSheet(.showRecipeList)
                    }
                    .padding(.top, 12)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    MainScreen()
        .environmentObject(MainStore())
}
