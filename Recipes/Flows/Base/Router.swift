//
//  Router.swift
//  Recipes
//
//  Created by Андрей Банин on 08.11.2025.
//

import SwiftUI
import Combine

final class Router<T: Hashable & Identifiable>: ObservableObject {
    
    @Published var routes: [T] = []
    @Published var screenCover: T?
    @Published var sheet: T?
    
    init() {}
    
    deinit {
        print("Router is deinit")
    }
    
    var onScreenCoverDismiss: (() -> Void)?
    var onSheetDismiss: (() -> Void)?
    
    func push(_ route: T) {
        routes.append(route)
    }
    
    func unwind(_ route: T) {
        guard let index = routes.firstIndex(where: { $0 == route }) else { return }
        routes = Array(routes.prefix(upTo: index + 1))
    }
    
    func pop() {
        routes.removeLast()
    }
    
    func showSheet(_ route: T, onDismiss: (() -> Void)? = nil) {
        sheet = route
        onSheetDismiss = onDismiss
    }
    
    func showScreenCover(_ route: T, onDismiss: (() -> Void)? = nil) {
        screenCover = route
        onScreenCoverDismiss = onDismiss
    }
    
    func dismiss() {
        screenCover = nil
        sheet = nil
    }
}
