//
//  MealTypeScrollView.swift
//  Recipes
//
//  Created by Андрей Банин on 06.03.2025.
//

import SwiftUI

struct MealTypeScrollView: View {
    
    @Binding var mealType: MealType
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(MealType.allCases.prefix(7), id: \.self) { index in
                        Button {
                            mealType = index
                        } label: {
                            Text(index.localizedDescription)
                                .foregroundStyle(index == mealType ? Color.text : Color.gray.opacity(0.5))
                                .padding(10)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(index == mealType ? Color.green.opacity(0.5) : Color.gray.opacity(0.5), lineWidth: 2))
                                .padding(.horizontal, 5)
                        }
                    }
                }
                .padding(16)
            }
        }
    }
}
