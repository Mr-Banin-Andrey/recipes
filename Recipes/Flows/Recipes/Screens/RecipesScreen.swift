//
//  RecipesView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
//import SwiftData

struct RecipesScreen: View {
//    @StateObject var viewModel: RecipesScreenViewModel
    @EnvironmentObject private var router: Router<RecipesRoute>
    @EnvironmentObject private var recipesStore: RecipesStore
    
    var body: some View {
//        NavigationStack {
            VStack(spacing: 0) {
                Text("RecipesScreen")
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
                        mealTypes: SortingData().sortingMenuSections(recipes: recipesStore.recipes),
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
                               
//                NavigationLink {
//                    AddNewRecipeScreenView(viewModel: AddNewRecipeScreenViewModel())
//                } label: {
                    Text("Добавить рецепт")
                        .modifier(GreenButtonModifier(textColor: .whiteColorText, backgroundColor: .greenButton))
                        .padding(.vertical, 16)
                        .shadow(radius: 2, x: 2, y: 2)
//                }
            }
            .modifier(NavigationBarTitleModifier(title: "Рецепты", color: .navBar))
//        }
    }
}

//#Preview {
//    RecipesScreen(viewModel: RecipesScreenViewModel())
//}
