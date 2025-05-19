//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import SwiftData
import Combine

struct MenuScreenView: View {
    @StateObject var viewModel: MenuScreenViewModel
            
    @State private var openedViewID: String? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    WeekView(viewModel: WeekViewModel()) { date in
                        withAnimation {
                            viewModel.displayMenuForSelectedDate(date)
                        }
                    }
                }
                .cornerRadius(16)
                .frame(height: 90)
                .padding(.vertical, 5)
                
                ScrollView(.vertical) {
                    ForEach($viewModel.mealTime) { mealTime in
                        if let index = viewModel.mealTime.firstIndex(of: mealTime.wrappedValue) {
                            MealView(
                                id: mealTime.id,
                                nameMealTime: mealTime.mealTimeType.wrappedValue.localizedDescription,
                                recipes: viewModel.recipes,
                                menuSection: SortingData().sortingMenuSections(recipes: viewModel.recipes),
                                color: colorForMealBackground(num: index),
                                selectedRecipe: mealTime.recipe,
                                openedViewID: $openedViewID)
                            .padding(.top, 12)
                        }
                    }

                    Spacer()
                }
            }
            .modifier(NavigationBarTitleModifier(title: "Меню", color: .navBar))
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
    }
}

//#Preview {
//    MenuScreenView(viewModel: MenuScreenViewModel())
//}
