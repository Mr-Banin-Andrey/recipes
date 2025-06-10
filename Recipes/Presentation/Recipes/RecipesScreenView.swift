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
                if viewModel.recipes.isEmpty {
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
                        mealTypes: SortingData().sortingMenuSections(recipes: viewModel.recipes),
                        mealType: $viewModel.mealType
                    )
                    
                    ScrollView {
                        ForEach(viewModel.recipes.filter { $0.meal == viewModel.mealType}) { recipe in
                            RecipeView(
                                viewModel: viewModel,
                                id: recipe.id,
                                title: recipe.name,
                                ingredients: recipe.ingredients,
                                methodOfPreparation: recipe.instruction,
                                color: colorForRecipeBackground(num: viewModel.getIndex(of: recipe))
                            )
                            .padding(.vertical, 4)
                        }
                    }
                }
                               
                NavigationLink {
                    AddNewRecipeScreenView(viewModel: AddNewRecipeScreenViewModel())
                } label: {
                    Text("Добавить рецепт")
                        .modifier(GreenButtonModifier(textColor: .whiteColorText, backgroundColor: .greenButton))
                        .padding(.vertical, 16)
                        .shadow(radius: 2, x: 2, y: 2)
                }
            }
            .modifier(NavigationBarTitleModifier(title: "Рецепты", color: .navBar))
        }
    }
}

#Preview {
    RecipesScreenView(viewModel: RecipesScreenViewModel())
}
