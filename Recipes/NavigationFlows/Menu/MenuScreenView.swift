//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import SwiftData

struct MenuScreenView: View {
    @StateObject var viewModel: MenuScreenViewModel
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Recipe.name) var recipes: [Recipe]
    
//    @State private var isPresented: Bool = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    WeekView(viewModel: WeekViewModel()) { date in
                        //TODO: разблокировать фильтрацию по дате
//                        viewModel.date = date
                    }
                }
                .cornerRadius(16)
                .frame(height: 90)
                .padding(.vertical, 5)
                
                ScrollView(.vertical) {
                    ForEach($viewModel.dishList.filter({ $0.date.wrappedValue == viewModel.date })[0].mealTime) { mealTime in
                        
//                    ForEach(viewModel.mealTime) { mealTime in
                        //TODO: переписать Recipe.fourRecipe
                        if let index = viewModel.dishList.filter({ $0.date == viewModel.date })[0].mealTime.firstIndex(of: mealTime.wrappedValue) {
                            MealView(
                                nameMealTime: mealTime.mealTimeType.wrappedValue.localizedDescription,
                                recipes: recipes,
                                menuSection: SortingData().menuSectionSorted(recipes: recipes),
                                selectedRecipe: mealTime.recipe,
                                isPresented: $viewModel.isOpenMealTime[index],
                                color: colorForMealBackground(num: index)) { value in
                                   
                                    isOpenMealTime(index, value)
                                    print("🐸", index , "🦊", viewModel.isOpenMealTime[index])
                                }
                            
                            .tag(index)
                            .padding(.top, 12)
                        }
                    }

                    Spacer()
                }
            }
            .modifier(NavigationBarTitleModifier(title: "Меню", color: .navBar))
            //TODO: выезжающие меню с настройками
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        
//                    } label: {
//                        Image(systemName: "ellipsis")
//                            .font(.body)
//                            .foregroundStyle(Color.mainText)
//                    }
//                }
//            }
        }
    }
    
    //TODO: подумать над открытием и закрытием
//    func isOpenMealTime(_ index: Int,_ isOpen: Bool) {
//
//        viewModel.isOpenMealTime.forEach { value in
//            if value == true {
//                if let index = viewModel.isOpenMealTime.firstIndex(of: value) {
//                    viewModel.isOpenMealTime[index] = false
//                }
////                if index
//            } else {
//                viewModel.isOpenMealTime[index] = true
//            }
//        }
//    }
//    
    func saveRecipe() {
//        let recipe = Recipe.mockRecipe
//        modelContext.insert(recipe)
    }
}

#Preview {
    MenuScreenView(viewModel: MenuScreenViewModel())
}
