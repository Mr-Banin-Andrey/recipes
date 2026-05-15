//
//  RecipesView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
//import SwiftData

struct RecipesScreen: View {

    @EnvironmentObject private var router: Router<RecipesRoute>
    @EnvironmentObject private var recipesStore: RecipesStore
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 0) {
            if recipesStore.recipes.isEmpty {
                Spacer()
                
                ZStack {
                    Image("backgroundRecipesImage")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.1)
                    
                    Text("Здесь будут ваши любимые рецепты!")
                        .font(.system(size: 22, weight: .regular))
                        .foregroundStyle(.mainText)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
            } else {
                MealTypeScrollView(
                    mealTypes: SortingData.sortingMenuSections(recipes: recipesStore.recipes),
                    mealType: $recipesStore.mealType
                )
                
                ScrollView {
                    ForEach(recipesStore.recipes.filter { $0.meal == recipesStore.mealType}) { recipe in
                        RecipeView(
                            //                                viewModel: recipesStore,
                            id: recipe.id,
                            title: recipe.name,
                            ingredients: recipe.ingredients,
                            methodOfPreparation: recipe.instruction,
                            color: colorForRecipeBackground(num: recipesStore.getIndex(of: recipe))
                        )
                        .padding(.vertical, 4)
                    }
                }
            }
            
            Text("Добавить рецепт")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.gray.opacity(0.8))
                .cornerRadius(20)
                .padding(.horizontal, 16)
                .shadow(radius: 2, x: 2, y: 2)
                .padding(.vertical, 12)
        }
    }
}

#Preview {
    RecipesScreen()
}
