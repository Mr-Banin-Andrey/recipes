//
//  MealView.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import SwiftUI

struct MealView: View {
    
    let id: String
    let nameMealTime: String
    var recipes: [Recipe]
    var menuSection: [MenuSectionType]
    let color: Color
    
    @Binding var selectedRecipe: Recipe?
    @Binding var openedViewID: String?

    @State private var selectedMeal: MenuSectionType = .breakfasts
    private var isPresented: Bool {
        openedViewID == id
    }
    
    //TODO: add UX for button "Add ingredient"
    @State private var isExpanded: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Text("\(nameMealTime):")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundStyle(Color.mainText)

                    Spacer()
                    
                    if selectedRecipe == nil {
                        Text("Выбрать блюдо")
                            .foregroundStyle(.selectedText)
                            .font(.system(size: 18, weight: .regular))
                    } else {
                        Text(selectedRecipe?.name ?? "")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(Color.selectedText)
                    }
                }
                
                if isPresented {
                    if recipes.isEmpty {
                        Text("Добавьте рецепты")
                            .font(.headline)
                            .foregroundStyle(Color.mainText)
                            .padding(.vertical, 24)
                    } else {
                        HStack(spacing: 16) {
                            if menuSection.count == 1 {
                                Button {
                                    selectedMeal = menuSection[0]
                                } label: {
                                    ZStack {
                                        Text(menuSection[0].localizedDescription)
                                            .font(.system(size: 18, weight: .regular))
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
                                                .font(.system(size: 18, weight: .regular))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 150)
                                }
                            }
                            
                            if recipes.filter({ $0.meal == selectedMeal }).count == 1 {
                                Button {
                                    selectedRecipe = recipes.filter{ $0.meal == selectedMeal }[0]
                                } label: {
                                    ZStack {
                                        Text(recipes.filter{ $0.meal == selectedMeal }[0].name)
                                            .font(.system(size: 18, weight: .regular))
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
                                                .font(.system(size: 18, weight: .regular))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 150)
                                }
                            }
                        }
                        .frame(height: 150)
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            //TODO: add UX for button "Add ingridient"
                            withAnimation {
                                isExpanded.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: isExpanded ? "checkmark.square" : "square")
                                
                                Text(isExpanded ? "Ингредиенты добавлены в покупки" : "Добавить ингредиенты в покупки")
                            }
                            .foregroundStyle(isExpanded ? Color.selectedText.opacity(0.25) : Color.selectedText)
                            .padding(.vertical, 8)
                        }
                        .disabled(isExpanded)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, isPresented ? 16 : 40)
        .padding(.bottom, isPresented ? 8 : 40)
        .background(color)
        .cornerRadius(20)
        .padding(.horizontal, 12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 4)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                if isPresented {
                    openedViewID = nil
                } else {
                    openedViewID = id
                }
            }
        }
    }
}

#Preview {
    MealView(
        id: "123",
        nameMealTime: "Dinner",
        recipes: Recipe.fourRecipe,
        menuSection: SortingData().sortingMenuSections(recipes: Recipe.fourRecipe),
        color: .fifth,
        selectedRecipe: .constant(Recipe.mockRecipe),
        openedViewID: .constant("123")
    )
}
