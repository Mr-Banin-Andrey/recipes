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
//        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    WeekView(viewModel: WeekViewModel()) { date in
                        withAnimation {
                            mainStore.displayMenuForSelectedDate(date)
                        }
                    }
                }
                .cornerRadius(16)
                .frame(height: 90)
                .padding(.vertical, 5)
                
                ScrollView(.vertical) {
                    ForEach($mainStore.mealTime) { mealTime in
                        if let index = mainStore.mealTime.firstIndex(of: mealTime.wrappedValue) {
                            MealView(
                                id: mealTime.id,
                                nameMealTime: mealTime.mealTimeType.wrappedValue.localizedDescription,
                                recipes: mainStore.recipes,
                                menuSection: SortingData().sortingMenuSections(recipes: mainStore.recipes),
                                color: colorForMealBackground(num: index),
                                selectedRecipe: mealTime.recipe,
                                openedViewID: $openedViewID)
                            .padding(.top, 12)
                        }
                    }

                    Spacer()
                }
            }
//            .modifier( NavigationBarTitleModifier(title: "Меню", color: .navBar))
            //TODO: выезжающие меню с настройками
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        
//                    } label: {
//                        Image(systemName: "ellipsis")
//                            .font(.body)
//                            .foregroundStyle(Color.mainText)
//                    }
//                }
//            }
        }
//    }
}

//#Preview {
//    MenuScreenView(viewModel: MenuScreenViewModel())
//}
