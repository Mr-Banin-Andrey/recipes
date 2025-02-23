//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.indigo
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                Text("Меню на неделю")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .scaledToFit()
            
            ZStack {
                WeekView()
            }
            .background(Color.blue)
            .scaledToFit()
            
            HStack {
                Text("Завтрак")
                    .padding()
                
                Spacer()
                
                
            }
            
            
            Spacer()
            
            //            Image(systemName: "globe")
            //                .imageScale(.large)
            //                .foregroundStyle(.tint)
            //            Text("Hello, Menu!")
            //
            //            Spacer()
        }
    }
}

#Preview {
    MenuView()
}
