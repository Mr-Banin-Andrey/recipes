//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import SwiftData

struct MenuScreenView: View {
    @StateObject var viewModel: MenuScreenViewModel
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Recipe.name) var recipes: [Recipe]
    
    @State private var openedViewID: String? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    WeekView(viewModel: WeekViewModel()) { date in
                        //TODO: разблокировать фильтрацию по дате
//                        viewModel.date = date
                    }
                }
                .cornerRadius(16)
                .frame(height: 90)
                .padding(.vertical, 5)
                
                ScrollView(.vertical) {
                    ForEach($viewModel.dishList.filter({ $0.date.wrappedValue == viewModel.date })[0].mealTime) { mealTime in
                        
//                    ForEach(viewModel.mealTime) { mealTime in
                        //TODO: переписать Recipe.fourRecipe
                        if let index = viewModel.dishList.filter({ $0.date == viewModel.date })[0].mealTime.firstIndex(of: mealTime.wrappedValue) {
                            MealView(
                                id: mealTime.id,
                                nameMealTime: mealTime.mealTimeType.wrappedValue.localizedDescription,
                                recipes: recipes,
                                menuSection: SortingData().menuSectionSorted(recipes: recipes),
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
    
    func saveRecipe() {
//        let recipe = Recipe.mockRecipe
//        modelContext.insert(recipe)
    }
}

#Preview {
    MenuScreenView(viewModel: MenuScreenViewModel())
}
