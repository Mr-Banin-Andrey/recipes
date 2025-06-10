//
//  AddNewRecipeScreenView.swift
//  Recipes
//
//  Created by Андрей Банин on 07.03.2025.
//

import SwiftUI

struct AddNewRecipeScreenView: View {
    @StateObject var viewModel: AddNewRecipeScreenViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    
                    //MARK: Название рецепта
                    VStack(spacing: 0) {
                        HStack {
                            Text("Название рецепта:")
                                .font(.title3)
                                .foregroundStyle(Color.mainText)
                            
                            Spacer()
                        }
                        
                        TextField("Введите текст", text: $viewModel.name)
                            .foregroundStyle(Color.titleColorForRecipeCell)
                            .padding(.top, 16)

                        CustomDivider(color: .second)
                            .padding(.top, 10)
                    }
                    .padding([.top, .horizontal], 16)
                    
                    //MARK: Тип блюда
                    VStack(spacing: 0) {
                        HStack {
                            Text("Тип блюда:")
                                .font(.title3)
                                .foregroundStyle(Color.mainText)
                            
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
                                        .foregroundStyle(Color.titleColorForRecipeCell)
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundStyle(Color.titleColorForRecipeCell)
                                }
                            }.id(viewModel.menuSection)
                        }
                        
            
                        CustomDivider(color: .fourth)
                            .padding(.top, 10)
                    }
                    .padding(.horizontal, 16)
                        
                    //MARK: Ингредиенты
                    HStack {
                        Text("Ингредиенты:")
                            .font(.title3)
                            .foregroundStyle(Color.mainText)
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                viewModel.addIngredient()
                            }
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.black)
                                .padding(12)
                                .background(Color.greenButton.opacity(0.8))
                                .cornerRadius(50)
                                .shadow(radius: 2, x: 2, y: 2)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(spacing: 0) {
                        ForEach($viewModel.ingredients) { ingredient in
                            AddIngredientView(
                                name: ingredient.name,
                                weight: ingredient.weight,
                                quantityType: ingredient.quantity
                            )
                            .padding(.vertical, 5)
                        }
                    }
                    
                    //MARK: Способ приготовления
                    HStack {
                        Text("Способ приготовления:")
                            .font(.title3)
                            .foregroundStyle(Color.mainText)
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    TextEditor(text: $viewModel.instruction)
                        .padding(5)
                        .frame(height: 180)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                }
            }
            
            Button {
                viewModel.saveRecipe()
                dismiss()
            } label: {
                Text("Сохранить рецепт")
                    .modifier(GreenButtonModifier(textColor: .whiteColorText, backgroundColor: .greenButton))
                    .padding(.vertical, 16)
                    .shadow(radius: 2, x: 2, y: 2)
            }
            .background(Color.gray.opacity(0.05))
        }
        .modifier(NavigationBarBackButtonModifier(title: "Добавить новый рецепт", color: .navBar))
    }
}

#Preview {
    AddNewRecipeScreenView(viewModel: AddNewRecipeScreenViewModel())
}
