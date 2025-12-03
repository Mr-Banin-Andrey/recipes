//
//  MealView.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import SwiftUI

struct MealView: View {
    
    @EnvironmentObject private var router: Router<MainRoute>
    
    @State private var widthTitle: CGFloat = .leastNonzeroMagnitude
    
    @Binding var selectedRecipe: Recipe?
    let id: String
    let nameMealTime: String
    let onSelect: () -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                createNameMealTimeView()
                createSelectedRecipe()
            }
        }
        .padding(.horizontal, 10)
        .background(.gramsHair)
        .cornerRadius(20)
        .padding(.horizontal, 12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 4)
    }
    
    @ViewBuilder
    private func createNameMealTimeView() -> some View {
        HStack {
            VStack(alignment: .center, spacing: 0) {
                Text("\(nameMealTime):")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color.mainText)
                    .fixedSize()
                    .clipShape(.rect(cornerRadius: 8))
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    widthTitle = geo.size.width + 16
                                }
                        }
                    )
                
                Divider()
                    .frame(width: widthTitle, height: 0.5)
            }
            
            Spacer()
        }
        .padding(.top, 6)
        .padding(.horizontal, 14)
    }
    
    @ViewBuilder
    private func createSelectedRecipe() -> some View {
        Button {
            onSelect()
        } label: {
            ZStack {
                if selectedRecipe == nil {
                    Text("Выбрать блюдо")
                        .foregroundStyle(.placeholderTextThird)
                        .font(.system(size: 18, weight: .regular))
                } else {
                    Text(selectedRecipe?.name ?? "")
                        .foregroundStyle(Color.secondaryText)
                        .font(.system(size: 18, weight: .regular))
                }
            }
            .padding()
        }
    }
}

#Preview {
    MealView(
        selectedRecipe: .constant(nil),
        id: "123",
        nameMealTime: "Dinner"
    ) {}
}
