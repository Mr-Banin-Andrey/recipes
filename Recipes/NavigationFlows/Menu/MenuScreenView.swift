//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct MenuScreenView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    WeekView(viewModel: WeekViewModel()) { date in
                        print(" date \(date)")
                    }
                }
                .background(Color.cell)
                .cornerRadius(16)
                .padding(10)
                
                ScrollView {
                    MealView(title: "Завтрак", selectedFood: Recipe.mockRecipe)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    
                    MealView(title: "Обед", selectedFood: Recipe.mockRecipe)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    
                    MealView(title: "Перекус", selectedFood: Recipe.mockRecipe)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    
                    MealView(title: "Ужин", selectedFood: Recipe.mockRecipe)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    
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
    MenuScreenView()
}
