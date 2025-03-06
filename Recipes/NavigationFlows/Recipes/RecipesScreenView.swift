//
//  RecipesView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct RecipesScreenView: View {
    
    @State private var mealType: MealType = .breakfast
        
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopNavigateView(title: "Рецепты",
                                isHiddenRightButton: false) {
                    print("button")
                }
                .scaledToFit()
                
                MealTypeScrollView()
//
//                Button {
//                    
//                } label: {
//                    Text("Выбрать категорию")
//                        .padding()
//                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
//                        .padding(16)
//                }
//
//                HStack {
//                    Text("Каша")
//                        .font(.title2)
//                        .foregroundStyle(Color.gray)
//                        .padding()
//                    
//                    Spacer()
//                }
//               
//                HStack {
//                    Text("Продукты:")
//                        .font(.title2)
//                        .foregroundStyle(Color.gray)
//                        .padding()
//                    Spacer()
//                }
//                
//                VStack{
//                    ForEach(0..<5) { _ in
//                        HStack {
//                            Text("-  Яйцо")
//                                .font(.title3)
//                            
//                            Spacer()
//                        }
//                    }
//                }
//                .padding()
//                
//                Divider()
//                
//                HStack {
//                    Text("Каша тыквенная")
//                        .font(.title)
//                        .foregroundStyle(Color.gray)
//                        .padding(10)
//                    
//                    Spacer()
//                }
//               
//                HStack {
//                    Text("Продукты:")
//                        .font(.title2)
//                        .foregroundStyle(Color.gray)
//                        .padding(10)
//                    Spacer()
//                }
//                
//                VStack{
//                    ForEach(0..<5) { _ in
//                        HStack {
//                            Text("-  Яйцо")
//                                .font(.title3)
//                            
//                            Spacer()
//                        }
//                    }
//                }
//                .padding()
                
                
//                TextField("Название рецепта", text: .constant(""))
//                    .padding()
//                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
//                    .padding(.horizontal, 16)
                
                Spacer()
            }
        }
    }
}

#Preview {
    RecipesScreenView()
}
