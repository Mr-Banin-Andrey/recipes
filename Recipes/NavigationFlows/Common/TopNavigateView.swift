//
//  TopNavigateView.swift
//  Recipes
//
//  Created by Андрей Банин on 06.03.2025.
//

import SwiftUI

struct TopNavigateView: View {
    
    var title: String
    
    var isHiddenRightButton: Bool = true
    var imageRightButton: String = ""
    var action: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Color.indigo
                .opacity(0.3)
                .ignoresSafeArea()
            
            HStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
//                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                
                Spacer()
                
                if !isHiddenRightButton {
                    Button {
                        guard let action else { return }
                        action()
                    } label: {
                        Image(systemName: imageRightButton)
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
        }
    }
}
