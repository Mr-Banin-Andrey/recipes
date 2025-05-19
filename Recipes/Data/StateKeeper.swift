//
//  StateKeeper.swift
//  Recipes
//
//  Created by Андрей Банин on 19.03.2025.
//

import SwiftUI

final class StateKeeper {
    @Published var recipes: [Recipe] = []
    @Published var dishLists: [DishList] = []
}
