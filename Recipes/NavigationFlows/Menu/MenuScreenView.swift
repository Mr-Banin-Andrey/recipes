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
                .background(Color.cell)
                .cornerRadius(16)
                .padding(10)
                
                ScrollView {
                    ForEach(viewModel.mealTime) { mealTime in
                        //TODO: переписать Recipe.fourRecipe
                        MealView(title: mealTime.localizedDescription, selectedFood: Recipe.mockRecipe)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                    }

                    Spacer()
                }
            }
            .modifier(NavigationBarTitleModifier(title: "Меню", color: .menuNavBar))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {

                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.body)
                            .foregroundStyle(Color.text)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuScreenView(viewModel: MenuScreenViewModel())
}
