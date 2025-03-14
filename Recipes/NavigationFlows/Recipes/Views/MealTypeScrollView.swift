//
//  MealTypeScrollView.swift
//  Recipes
//
//  Created by Андрей Банин on 06.03.2025.
//

import SwiftUI

struct MealTypeScrollView: View {
    
    var mealTypes: [MenuSectionType]
    @Binding var mealType: MenuSectionType
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(mealTypes, id: \.self) { index in
                        if !mealTypes.isEmpty {
                            Button {
                                mealType = index
                            } label: {
                                Text(index.localizedDescription)
                                    .foregroundStyle(index == mealType ? Color.selectedText : Color.gray.opacity(0.5))
                                    .padding(10)
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(index == mealType ? Color.green.opacity(0.5) : Color.gray.opacity(0.5), lineWidth: 2))
                                    .padding(.horizontal, 5)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 16)
            }
        }
    }
}
