//
//  MealView.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import SwiftUI

struct MealView: View {
    
    var nameMealTime: String
    var recipes: [Recipe]
    var menuSection: [MenuSectionType]
    
    @Binding var selectedRecipe: Recipe
    @Binding var isPresented: Bool
    @State private var selectedMeal: MenuSectionType = .breakfasts
   
    var color: Color
    
    var action: (Bool) -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isPresented.toggle()
                            action(isPresented)
                        }
                    } label: {
                        HStack {
                            Text("\(nameMealTime):")
                                .font(.headline)
                                .foregroundStyle(Color.mainText)

                            Spacer()
                            
                            if selectedRecipe.name.isEmpty {
                                Text("Выбрать блюдо")
                                    .foregroundStyle(.selectedText)
                            } else {
                                Text(selectedRecipe.name)
                                    .bold()
                                    .font(.headline)
                                    .foregroundStyle(Color.selectedText)
                            }
                        }
                    }
                }
                
                if isPresented {
                    if recipes.isEmpty {
                        Text("Добавьте рецепты")
                            .font(.headline)
                            .foregroundStyle(Color.mainText)
                            .frame(height: 50)
                    } else {
                        HStack(spacing: 16) {
                            if menuSection.count == 1 {
                                Button {
                                    selectedMeal = menuSection[0]
                                } label: {
                                    ZStack {
                                        Text(menuSection[0].localizedDescription)
                                            .font(.body)
                                            .foregroundStyle(Color.mainText.opacity(0.85))
                                            .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 32)
                                            .background(Color.cell)
                                            .cornerRadius(8)
                                        
                                        Color.gray.opacity(0.15)
                                            .blur(radius: 1)
                                            .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 32)
                                            .cornerRadius(8)
                                    }
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: ((UIScreen.main.bounds.width - 60) / 2) - 18, height: 32)
                                        .foregroundStyle(.cell)
                                    
                                    Picker("", selection: $selectedMeal) {
                                        ForEach(menuSection) { meal in
                                            Text(meal.localizedDescription).tag(meal)
                                                .font(.body)
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 130)
                                }
                            }
                            
                            if recipes.filter({ $0.meal == selectedMeal }).count == 1 {
                                Button {
                                    selectedRecipe = recipes.filter{ $0.meal == selectedMeal }[0]
                                } label: {
                                    ZStack {
                                        Text(recipes.filter{ $0.meal == selectedMeal }[0].name)
                                            .font(.body)
                                            .foregroundStyle(Color.mainText.opacity(0.85))
                                            .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 32)
                                            .background(Color.cell)
                                            .cornerRadius(8)
                                        
                                        Color.gray.opacity(0.15)
                                            .blur(radius: 1)
                                            .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 32)
                                            .cornerRadius(8)
                                    }
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: ((UIScreen.main.bounds.width - 60) / 2) - 18, height: 32)
                                        .foregroundStyle(.cell)
                                    
                                    Picker("", selection: $selectedRecipe) {
                                        ForEach(recipes.filter { $0.meal == selectedMeal }) { recipe in
                                            Text(recipe.name).tag(recipe)
                                                .font(.body)
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 130)
                                }
                            }
                        }
                        .frame(height: 130)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, isPresented ? 24 : 40)
        .padding(.bottom, isPresented ? 14 : 40)
        .background(color)
        .cornerRadius(20)
        .padding(.horizontal, 12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 4)
    }
}
//
//#Preview {
//    MealView(
//        nameMealTime: "Dinner",
//        recipes: Recipe.fourRecipe,
//        menuSection: SortingData().menuSectionSorted(recipes: Recipe.fourRecipe),
//        selectedRecipe: .constant(Recipe.mockRecipe),
//        isPresented: true,
//        color: .fourth) {
//            print("123")
//        }
//    
//}
