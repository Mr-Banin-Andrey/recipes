//
//  RecipeView.swift
//  Recipes
//
//  Created by Андрей Банин on 06.03.2025.
//

import SwiftUI

struct RecipeView: View {
    @StateObject var viewModel: RecipesScreenViewModel
    
    var id: String
    var title: String
    var ingredients: [Ingredient]
    var methodOfPreparation: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color.titleColorForRecipeCell)
                Spacer()
            }
            .padding(8)
                        
            ForEach(ingredients.count > 3 ? ingredients.prefix(2) : ingredients.prefix(ingredients.count)) { ingredient in
                HStack {
                    Text("- \(ingredient.name)")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.ingredient)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 12)
            
            if ingredients.count > 3 {
                HStack {
                    Text("- ...")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.ingredient)
                    
                    Spacer()
                }
                .padding(.horizontal, 12)
            }
            
            NavigationLink {
                RecipeInfoView(recipe: viewModel.recipes.first(where: { $0.id == id }) ?? Recipe.mockRecipe)
            } label: {
                HStack {
                    Text("Показать подробней")
                        .foregroundStyle(Color.mainText)
                        .font(.system(size: 16, weight: .regular))
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.mainText)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                }
                .padding(9)
            }
        }
        .background(color)
        .cornerRadius(20)
        .padding(.horizontal, 12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 4)
    }
}

#Preview {
    RecipeView(
        viewModel: RecipesScreenViewModel(),
        id: "",
        title: "Dinner",
        ingredients: [
            Ingredient(id: UUID().uuidString, name: "Картошка", weight: "3", quantity: QuantityType.perPiece),
            Ingredient(id: UUID().uuidString, name: "Морковка", weight: "2", quantity: QuantityType.perPiece),
            Ingredient(id: UUID().uuidString, name: "Яйца", weight: "3", quantity: QuantityType.perPiece),
            Ingredient(id: UUID().uuidString, name: "Вареной колбасы или ветчины", weight: "200", quantity: QuantityType.gram),
           ],
        methodOfPreparation: "efwfq",
        color: .fifth)
}
