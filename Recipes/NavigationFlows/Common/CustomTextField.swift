//
//  CustomTextField.swift
//  Recipes
//
//  Created by Андрей Банин on 07.03.2025.
//

import SwiftUI

struct CustomTextField: View {
    
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField(title, text: $text)
        }
    }
}

//#Preview {
//    CustomTextField(title: "Test")
//}
