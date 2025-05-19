//
//  RecipeInfoView.swift
//  Recipes
//
//  Created by Андрей Банин on 02.04.2025.
//


import SwiftUI

struct RecipeInfoView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Text(recipe.id)
            Text(recipe.name)
            Text(recipe.meal.localizedDescription)
            
            ForEach(recipe.ingredients) { ingredient in
                Text(ingredient.name)
            }
        }
    }
}