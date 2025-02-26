//
//  MealView.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import SwiftUI

struct MealView: View {
    
    var title: String
    @State private var isPresented: Bool = false
    var recipes = Recipe.fourRecipe
    @State private var selectedMeal: MealType = .breakfast
    @State var selectedFood: Recipe
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isPresented.toggle()
                        }
                    } label: {
                        HStack {
                            Text("\(title):")
                                .font(.title2)
                                .foregroundStyle(Color.gray)

                            Spacer()
                            
                            if selectedFood.name.isEmpty {
                                Text("Выбрать блюдо")
                            } else {
                                Text(selectedFood.name)
                                    .bold()
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                }
                
                if isPresented {
                    HStack {
                        Picker("", selection: $selectedMeal) {
                            ForEach(MealType.allCases) { meal in
                                Text(meal.localizedDescription).tag(meal)
                            }
                        }
                        .pickerStyle(.wheel)
                        
                        Picker("", selection: $selectedFood) {
                            ForEach(recipes.filter { $0.meal == selectedMeal }) { recipe in
                                Text(recipe.name).tag(recipe)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.3))
        .cornerRadius(20)
    }
}

#Preview {
    MealView(title: "Lunch", recipes: Recipe.fourRecipe, selectedFood: Recipe.fourRecipe[0])
}
