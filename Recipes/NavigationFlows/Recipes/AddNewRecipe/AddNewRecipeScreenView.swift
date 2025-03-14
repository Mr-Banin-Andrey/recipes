//
//  AddNewRecipeScreenView.swift
//  Recipes
//
//  Created by Андрей Банин on 07.03.2025.
//

import SwiftUI

struct AddNewRecipeScreenView: View {
    @StateObject var viewModel: AddNewRecipeScreenViewModel
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 8) {
                HStack {
                    Text("Название рецепта:")
                        .font(.title3)
                        .foregroundStyle(Color.text)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top, 16)
                
                TextField("", text: $viewModel.name)
                    .padding(.horizontal, 16)
                
                Divider()
                    .padding(.horizontal, 16)
                
                HStack {
                    Text("Тип блюда:")
                        .font(.title3)
                        .foregroundStyle(Color.text)
                    
                    Spacer()
                    
                    Menu {
                        Picker(selection: $viewModel.menuSection) {
                            ForEach(MenuSectionType.allCases) { value in
                                Text(value.localizedDescription)
                                    .tag(value)
                            }
                        } label: {}
                    } label: {
                        HStack {
                            Text(viewModel.menuSection.localizedDescription)
                                .keyboardType(.numberPad)
                            
                            Image(systemName: "chevron.up.chevron.down")
                                .foregroundStyle(Color.text)
                        }
                    }.id(viewModel.menuSection)
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                Divider()
                    .padding(.horizontal, 16)
                
                HStack {
                    Text("Ингредиенты:")
                        .font(.title3)
                        .foregroundStyle(Color.text)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top, 24)
                
                ForEach($viewModel.ingredients) { ingredient in
                    AddIngredientView(
                        name: ingredient.name,
                        weight: ingredient.weight,
                        quantityType: ingredient.quantity
                    )
                    .padding(.vertical, 5)
                }
                
                
                Button {
                    withAnimation {
                        viewModel.addIngredient()
                    }
                } label: {
                    Text("Добавить ингредиент")
                        .padding(10)
                        .foregroundStyle(Color.text)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green.opacity(0.5), lineWidth: 2))
                }
                
                HStack {
                    Text("Способ приготовления:")
                        .font(.title3)
                        .foregroundStyle(Color.text)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top, 24)
                
                TextEditor(text: $viewModel.instruction)
                    .padding(5)
                    .frame(height: 180)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                
                Spacer()
            }
        }
        .modifier(NavigationBarBackButtonModifier(title: "Добавить новый рецепт", color: .recipesNavBar.opacity(0.5)))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    saveRecipe()
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundColor(.text)
                }
            }
        }
    }
    
    func saveRecipe() {
        let recipe = Recipe(
            id: UUID().uuidString,
            name: viewModel.name,
            meal: viewModel.menuSection,
            instruction: viewModel.instruction,
            ingredients: viewModel.ingredients
        )
        
        modelContext.insert(recipe)
    }
}

#Preview {
    AddNewRecipeScreenView(viewModel: AddNewRecipeScreenViewModel())
}
