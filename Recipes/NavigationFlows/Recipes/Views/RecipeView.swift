//
//  RecipeView.swift
//  Recipes
//
//  Created by Андрей Банин on 06.03.2025.
//

import SwiftUI

struct RecipeView: View {
    
    var title: String
    var ingredients: [Ingredient]
    var methodOfPreparation: String
    
    @State private var isDescriptionOpened = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.title2)
                    .foregroundStyle(Color.mainText)
                Spacer()
            }
            .padding(.horizontal, 16)
            
            VStack{
                ForEach(ingredients) { ingredient in
                    HStack {
                        Text("-  \(ingredient.name)")
                            .font(.body)
                            .foregroundStyle(.mainText)
                        
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 24)
            
            Button {
                withAnimation(.easeInOut) {
                    isDescriptionOpened.toggle()
                }
            } label: {
                HStack {
                    Text("Способ приготовления")
                        .padding(8)
                        .foregroundStyle(Color.indigo.opacity(0.9))
                        .bold()
                    
                    Image(systemName: "chevron.right")
                        .rotationEffect(isDescriptionOpened ? .degrees(90) : .degrees(0))
                        .foregroundStyle(Color.indigo.opacity(0.9))
                        .bold()
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            
            if isDescriptionOpened {
                HStack {
                    Text(methodOfPreparation)
                        .multilineTextAlignment(.leading)
                }
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            
            Divider()
        }
    }
}

//#Preview {
//    RecipeView()
//}
