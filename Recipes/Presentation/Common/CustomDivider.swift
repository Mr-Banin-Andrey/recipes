//
//  CustomDivider.swift
//  Recipes
//
//  Created by Андрей Банин on 27.05.2025.
//

import SwiftUI

struct CustomDivider: View {
    
    var wigth: CGFloat = .infinity
    var height: CGFloat = 0.6
    var color: Color = .gray
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(maxWidth: wigth, maxHeight: height)
        }
    }
}
