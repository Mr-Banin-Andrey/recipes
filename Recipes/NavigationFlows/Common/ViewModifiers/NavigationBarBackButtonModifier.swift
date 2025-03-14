//
//  NavigationBarBackButtonModifier.swift
//  Recipes
//
//  Created by Андрей Банин on 07.03.2025.
//

import SwiftUI

struct NavigationBarBackButtonModifier: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    
    var title: String
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.mainText)
                    }
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .gesture(
                DragGesture(coordinateSpace: .local)
                    .onEnded{ value in
                        if value.translation.width > .zero
                            && value.translation.height > -30
                            && value.translation.height < 30 {
                            dismiss()
                        }
                    }
            )
    }
}
