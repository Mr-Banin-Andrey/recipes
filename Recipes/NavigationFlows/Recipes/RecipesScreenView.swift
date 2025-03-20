//
//  RecipesView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import SwiftData

struct RecipesScreenView: View {
    @StateObject var viewModel: RecipesScreenViewModel
        
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                MealTypeScrollView(
                    mealTypes: SortingData().sortingMenuSections(recipes: viewModel.recipes),
                    mealType: $viewModel.mealType
                )

                List(viewModel.recipes.filter { $0.meal == viewModel.mealType}) { recipe in
                    RecipeView(
                        title: recipe.name,
                        ingredients: recipe.ingredients,
                        methodOfPreparation: recipe.instruction)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .modifier(NavigationBarTitleModifier(title: "Рецепты", color: .navBar))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddNewRecipeScreenView(viewModel: AddNewRecipeScreenViewModel())
                    } label: {
                        Image(systemName: "plus")
                            .font(.body)
                            .foregroundStyle(Color.selectedText)
                    }
                }
            }
        }
    }
}

#Preview {
    RecipesScreenView(viewModel: RecipesScreenViewModel())
}
