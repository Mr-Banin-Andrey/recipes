//
//  RecipesView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct RecipesScreenView: View {
    
    @State var mealType: MealType = .breakfast
        
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                MealTypeScrollView(mealType: $mealType)

                ScrollView {
                    ForEach(Recipe.fourRecipe.filter { $0.meal == mealType}) { recipe in
                        RecipeView(
                            title: recipe.name,
                            ingredients: recipe.ingredients,
                            methodOfPreparation: recipe.instruction)
                    }
                }
                
                Spacer()
            }
            
            .modifier(NavigationBarTitleModifier(title: "Рецепты"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {

                    } label: {
                        Image(systemName: "plus")
                            .font(.body)
                            .foregroundStyle(Color.indigo)
                    }
                }
            }
        }
    }
}

#Preview {
    RecipesScreenView()
}
