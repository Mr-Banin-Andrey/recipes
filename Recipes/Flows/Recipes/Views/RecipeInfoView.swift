//
//  RecipeInfoView.swift
//  Recipes
//
//  Created by Андрей Банин on 02.04.2025.
//


import SwiftUI

struct RecipeInfoView: View {
//    @StateObject var viewModel = RecipeInfoViewModel()
    
    var recipe: Recipe
    
    var body: some View {
        
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                HStack {
                    Text("Список ингредиентов:")
                    
                    Spacer()
                }
                .padding([.top, .horizontal], 16)
                
                ForEach(recipe.ingredients) { ingredient in
                    HStack {
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                            .scaleEffect(0.7)
                        
                        Text(ingredient.name)
                        
                        Spacer()
                    }
                    .padding(.vertical, 2)
                    .padding(.leading, 28)
                }
                
                HStack {
                    Text("Способ приготовления:")
                    
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                HStack {
                    Text(recipe.instruction)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    
                    Spacer()
                }
                .background(Color.fifth)
                .clipShape(.rect(cornerRadius: 20))
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .shadow(radius: 2, x: 2, y: 2)
                
                Spacer()
            }
                
            Button {
                //TODO: удаление рецепта
            } label: {
                Text("Удалить рецепт")
                    .modifier(GreenButtonModifier(textColor: .titleColorForRecipeCell, backgroundColor: .firstDivirer.opacity(1)))
                    .padding(.top, 16)
                    .shadow(radius: 2, x: 2, y: 2)
            }
            
            Button {
                //TODO: редактирование рецепта
                
            } label: {
                Text("Редактировать рецепт")
                    .modifier(GreenButtonModifier(textColor: .whiteColorText, backgroundColor: .greenButton))
                    .padding(.vertical, 16)
                    .shadow(radius: 2, x: 2, y: 2)
            }
        }
        .modifier(NavigationBarBackButtonModifier(title: recipe.name, color: .navBar))
    }
}

#Preview {
    RecipeInfoView(recipe: Recipe.fourRecipe[0])
}
