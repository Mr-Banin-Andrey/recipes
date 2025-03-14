//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct MenuScreenView: View {
    @StateObject var viewModel: MenuScreenViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    WeekView(viewModel: WeekViewModel()) { date in
                        viewModel.date = date
                    }
                }
                .cornerRadius(16)
                .frame(height: 90)
                .padding(.vertical, 5)
                
                ScrollView(.vertical) {
                    ForEach(viewModel.mealTime) { mealTime in
                        //TODO: переписать Recipe.fourRecipe
                        if let index = viewModel.mealTime.firstIndex(of: mealTime) {
                            MealView(
                                nameMealTime: mealTime.localizedDescription,
                                recipes: Recipe.fourRecipe,
                                menuSection: SortingData().menuSectionSorted(recipes: Recipe.fourRecipe),
                                selectedRecipe: $viewModel.selectedRecipe,
                                isPresented: false,
                                color: colorForMealBackground(num: index))
                            .padding(.top, 12)
                        }
                    }

                    Spacer()
                }
            }
            .modifier(NavigationBarTitleModifier(title: "Меню", color: .navBar))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {

                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.body)
                            .foregroundStyle(Color.mainText)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuScreenView(viewModel: MenuScreenViewModel())
}
