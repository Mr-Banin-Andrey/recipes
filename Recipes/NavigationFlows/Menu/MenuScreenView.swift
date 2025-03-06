//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct MenuScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopNavigateView(
                    title: "Меню",
                    isHiddenRightButton: false,
                    imageRightButton: "ellipsis"
                ) {
                    print("button")
                }
                .scaledToFit()
                
                ZStack {
                    WeekView { date in
                        print(" date \(date)")
                    }
                }
                .background(Color.gray.opacity(0.15))
                .cornerRadius(16)
                .padding(5)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 5, y: 5)
                
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
        }
    }
}

#Preview {
    MenuScreenView()
}
