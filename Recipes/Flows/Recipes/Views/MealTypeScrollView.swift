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
                    ForEach(mealTypes, id: \.self) { type in
                        if !mealTypes.isEmpty {
                            Button {
                                mealType = type
                            } label: {
                                Text(type.localizedDescription)
                                    .font(Font.system(size: 16, weight: .regular))
                                    .foregroundStyle(Color.mainText)
                                    .padding(15)
                                    .padding(.vertical, 2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .background(type == mealType ? Color.gray.opacity(0.7) : Color.clear)
                                    .clipShape(.rect(cornerRadius: 16))
                                    .padding(.trailing, mealTypes.last != type ? 8 : 0)
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

#Preview {
    MealTypeScrollView(mealTypes: [.breakfasts, .dessert, .drinks, .salads], mealType: .constant(.breakfasts))
}
