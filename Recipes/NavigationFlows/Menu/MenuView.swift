//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Color.indigo
                        .opacity(0.3)
                        .ignoresSafeArea()
                    
                    HStack {
                        Text("Меню на неделю")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                        Spacer()
                        
                        Button {
                            print("button")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                }
                .scaledToFit()
                
                ZStack {
                    WeekView()
                }
                //            .background(Color.blue)
                .scaledToFit()
                
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
    MenuView()
}
