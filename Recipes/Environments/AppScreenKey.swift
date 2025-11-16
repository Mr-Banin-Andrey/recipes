//
//  AppScreenKey.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI

struct AppScreenKey: EnvironmentKey {
    static let defaultValue: Binding<AppScreen> = .constant(.main)
}

extension EnvironmentValues {
    var appScreen: Binding<AppScreen> {
        get { self[AppScreenKey.self] }
        set { self[AppScreenKey.self] = newValue }
    }
}

extension View {
    func appScreen(_ state: Binding<AppScreen>) -> some View {
        environment(\.appScreen, state)
    }
}
