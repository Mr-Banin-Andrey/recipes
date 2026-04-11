//
//  MenuView.swift
//  Recipes
//
//  Created by Андрей Банин on 23.02.2025.
//

import SwiftUI
import SwiftData
import Combine

struct MainScreen: View {
    
    @EnvironmentObject private var router: Router<MainRoute>
    @EnvironmentObject private var mainStore: MainStore
    
    @State private var openedViewID: String? = nil
    
    private var mealTimeItems: [MealTimeItem] = MealTimeItem.mockMealTimeItems
    
    @Query var diningTimes: [DiningTime]
//    @Query vacr mealTimes: [MealTimeItem]
//    @Query(
//        sort: \MealTimeItem.dateOfChange,
//        order: .reverse
//    ) private var mealTimes: [MealTimeItem]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                WeekView() { date in
                    mainStore.displayMenuForSelectedDate(date)
                }
            }
            .cornerRadius(16)
            .frame(height: 90)
            .padding(.vertical, 5)

            ForEach(filterDiningTime()) { mealTime in
                MealView(
                    mealTime: mealTime.mealTimeType,
                    selectedRecipe: mealTime.recipe
                ) {
//                        router.showSheet(
//                            .showRecipeList(<#T##DiningTime#>)
//                        )
                }
            }
                     
            Spacer()
        }
        .navigationTitle("Меню на неделю")
    }
    
    func filterDiningTime() -> [DiningTime] {
        
        // Получили день со всеми приёмами пищи
        var dayDiningTimes = diningTimes.filter({ $0.date == mainStore.selectedDate })
        
        // Проверяем наличие всех приемов пищи
        // при отсутсвии, добавляем
        dayDiningTimes = checkindDiningTimes(dayDiningTimes)
        
        // Сортируем по порядку приема пищи
        dayDiningTimes = SortingData.sortingMeals(dayDiningTimes)
        print(dayDiningTimes)
        return dayDiningTimes
    }
    
    // Проверка на наличии всех приемов пищи
    func checkindDiningTimes(_ dayDiningTimes: [DiningTime]) -> [DiningTime] {
        var dayDiningTimes = dayDiningTimes
        
        guard let item = mealTimeItems.last else { return [] }
        
        // Собираем типы, которые уже есть
        let existingTypes = Set(dayDiningTimes.map { $0.mealTimeType })
        
        // Проходим по нужным типам из настроек
        item.mealTypes.forEach { type in
            if !existingTypes.contains(type) {
                // Создаем НОВЫЙ объект для каждого отсутствующего приема пищи
                let newMeal = DiningTime(
                    id: UUID().uuidString,
                    date: mainStore.selectedDate, // используем дату из стора
                    mealTimeType: type,
                    recipe: .emptyRecipe
                )
                dayDiningTimes.append(newMeal)
            }
        }
        
        return dayDiningTimes
    }
//    func checkindDiningTimes(_ dayDiningTimes: [DiningTime]) -> [DiningTime] {
//        
//        var dayDiningTimes = dayDiningTimes
//        
//        guard let item = mealTimeItems.last else {
//            // "Нет приёмов пищи"
//            return []
//        }
//        
//        var dictionary: [MealTimeType: Bool] = [:]
//        
//        item.mealTypes.forEach { type in
//            dictionary[type] = false
//            
//        }
//        
//        print(dictionary)
//        
//        dayDiningTimes.forEach { diningTime in
//            dictionary[diningTime.mealTimeType] = true
//        }
//        print("--------")
//        print(dictionary)
//        print(dayDiningTimes)
//        
//        let newDiningTime: DiningTime = .init(
//            id: UUID().uuidString,
//            date: dayDiningTimes.last?.date ?? Date(),
//            mealTimeType: .breakfast,
//            recipe: .emptyRecipe
//        )
//        
//        dictionary.forEach { value in
//            switch value.key {
//            case .breakfast:
//                if value.value == false {
//                    newDiningTime.id = UUID().uuidString
//                    newDiningTime.mealTimeType = .breakfast
//                    dayDiningTimes.append(newDiningTime)
//                }
//            case .secondBreakfast:
//                if value.value == false {
//                    newDiningTime.id = UUID().uuidString
//                    newDiningTime.mealTimeType = .secondBreakfast
//                    dayDiningTimes.append(newDiningTime)
//                }
//            case .lunch:
//                if value.value == false {
//                    newDiningTime.id = UUID().uuidString
//                    newDiningTime.mealTimeType = .lunch
//                    dayDiningTimes.append(newDiningTime)
//                }
//            case .afternoonSnack:
//                if value.value == false {
//                    newDiningTime.id = UUID().uuidString
//                    newDiningTime.mealTimeType = .afternoonSnack
//                    dayDiningTimes.append(newDiningTime)
//                }
//            case .dinner:
//                if value.value == false {
//                    newDiningTime.id = UUID().uuidString
//                    newDiningTime.mealTimeType = .breakfast
//                    dayDiningTimes.append(newDiningTime)
//                }
//            case .snack:
//                if value.value == false {
//                    newDiningTime.id = UUID().uuidString
//                    newDiningTime.mealTimeType = .breakfast
//                    dayDiningTimes.append(newDiningTime)
//                }
//            }
//        }
//        
//        return dayDiningTimes
//    }
}
//
//#Preview {
//    MainScreen()
//        .environmentObject(MainStore())
//}
