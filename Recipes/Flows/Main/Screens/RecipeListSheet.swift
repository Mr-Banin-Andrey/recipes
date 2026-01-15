//
//  RecipeListSheet.swift
//  Recipes
//
//  Created by Андрей Банин on 23.11.2025.
//

import SwiftUI

struct RecipeListSheet: View {
        
    @Environment(\.dismiss) var dismiss
    @State private var currentMeal: MenuSectionType = .breakfasts
    var menuSectionType: MealTimeType
    
    // доставать рецепты из swiftdata
    @EnvironmentObject private var store: MainStore
    
    var body: some View {
        VStack(spacing: 0) {
            createTopView()
            createMenuSectionsView()            
            createRecipeListView()
        }
        .background(Color.antiFlashWhite)
    }
    
    @ViewBuilder
    private func createTopView() -> some View {
        ZStack {
            Color.gramsHair
                .frame(maxWidth: .infinity, maxHeight: 30)
            
            Rectangle()
                .foregroundStyle(.secondaryText)
                .frame(width: 30, height: 3)
                .clipShape(.rect(cornerRadius: 8))
        }
        
    }
    
    @ViewBuilder
    private func createMenuSectionsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(
                    SortingData()
                        .sortingMenuSections(recipes: store.recipes)
                ) { meal in
                    Button {
                        withAnimation {
                            currentMeal = meal
                        }
                    } label: {
                        Text(meal.localizedDescription)
                            .foregroundStyle(
                                currentMeal == meal
                                ? .mainText
                                : .placeholderTextThird
                            )
                            .padding(.horizontal, 8)
                    }
                }
            }
        }
        .frame(height: 50)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 20))
    }
    
    @ViewBuilder
    private func createRecipeListView() -> some View {
        List(store.recipes.filter { $0.meal == currentMeal }) { recipe in
            Button {
                
                dismiss()
            } label: {
                // TODO: Добавить логику выбраного блюда, если оно есть
                Text(recipe.name)
                    .foregroundStyle(.mainText)
            }
            
        }
        .listStyle(.insetGrouped)
        
    }
}

//#Preview {
//    RecipeListSheet()
//        .environmentObject(MainStore())
//}
