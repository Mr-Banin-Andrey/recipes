//
//  Recipe.swift
//  Recipes
//
//  Created by Андрей Банин on 24.02.2025.
//

import Foundation
import SwiftData

@Model
final class Recipe: Hashable, Identifiable {
    @Attribute(.unique)
    var id: String
    var name: String
    var meal: MenuSectionType
    var instruction: String
    var ingredients: [Ingredient]
    
    init(id: String, name: String, meal: MenuSectionType, instruction: String, ingredients: [Ingredient]) {
        self.id = id
        self.name = name
        self.meal = meal
        self.instruction = instruction
        self.ingredients = ingredients
    }
}


//TODO: снести после обновления всех данных
extension Recipe {

    static let mockRecipe: Recipe = Recipe(id: "", name: "", meal: .breakfasts, instruction: "", ingredients: [])
        
    static let fourRecipe: [Recipe] = [
        Recipe(
            id: UUID().uuidString,
            name: "Тост с авокадо",
            meal: .breakfasts,
            instruction: "Снимается шкурка с авокадо. В глубокой тарелке разиминается авокадо в пюре. Немножко посолить. На поджареный тост намазываем вилкой",
            ingredients: [
                Ingredient(id: UUID().uuidString, name: "Авокадо", weight: "1", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Хлеб", weight: "2", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Соль", weight: "1", quantity: QuantityType.gram)
        ]),
        Recipe(
            id: UUID().uuidString,
            name: "Оливье",
            meal: .salads,
            instruction: "Отварите картофель, морковь и яйца в подсоленной воде до готовности (около 15-20 минут).\nВ это время отварите chosen колбасу или ветчину согласно инструкции на упаковке.\nОчистите остывшие овощи и яйца.\nНарежьте кубиками:\nКартофель,\nМорковь,\nВареную колбасу/ветчину,\nЯйца,\nИзмельчите лук мелким кубиком.\nВ большой миске смешайте:\nНарезанные ингредиенты,\nЗеленый горошек (не разминая),\nИзмельченный лук,\nЗаправьте салат майонезом.\nТщательно перемешайте все ингредиенты. Попробуйте и при необходимости добавьте соль и перец. Уберите салат в холодильник минимум на 1 час перед подачей.",
            ingredients: [
                Ingredient(id: UUID().uuidString, name: "Картошка", weight: "3", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Морковка", weight: "2", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Яйца", weight: "3", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Вареной колбасы или ветчины", weight: "200", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Консервированного зеленого горошка", weight: "150", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Луковица", weight: "1", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Майонез", weight: "200", quantity: QuantityType.milliliter)
        ]),
        Recipe(
            id: UUID().uuidString,
            name: "Овсянка на воде",
            meal: .breakfasts,
            instruction: "Взять овсянку, которую нужно варить не менее 15 минут. Взять 300 грамм, промыть в проточной воде. Залить 900 мл воды в кастрюлю и высыпать овсянку. Включить максимальный огонь. После того как овсянка начнет подниматься, помешивая убрать огонь в половину. Добавить столовую ложку сахара и несколько щипоток соли",
            ingredients: [
                Ingredient(id: UUID().uuidString, name: "Овсянка", weight: "300", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Вода", weight: "900", quantity: QuantityType.milliliter),
        ]),
        Recipe(
            id: UUID().uuidString,
            name: "Cиннабон",
            meal: .dessert,
            instruction: "Булочки синнабон можно приготовить быстрее, если использовать магазинное слоёное дрожжевое тесто. В духовке витые булочки с безумно ароматной сахарно-коричной начинкой покрываются лёгкой хрустящей корочкой. Для глазури задействован кремовый маскарпоне, который придаёт булочкам невероятную сливочную нотку.",
            ingredients: [
                Ingredient(id: UUID().uuidString, name: "Тесто слоеное дрожжевое", weight: "600", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Сахар", weight: "70", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Корица молотая", weight: "15", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Маскарпоне", weight: "250", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Ванильный сахар", weight: "10", quantity: QuantityType.gram)
        ]),
        Recipe(
            id: UUID().uuidString,
            name: "томатный суп с куриными фрикадельками",
            meal: .soups,
            instruction: "Если вы любите помидоры так, как люблю их я, то этот 'тройной' томатный суп с куриными фрикадельками просто должен быть в вашем обеденном меню. Для приготовления используются томатный соус, томатное пюре и нарезанные помидоры, благодаря чему суп получается очень насыщенным.",
            ingredients: [
                Ingredient(id: UUID().uuidString, name: "Куриная грудка", weight: "500", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Помидоры", weight: "3", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Морковь", weight: "1", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Лук репчатый мелкий", weight: "4", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Соус томатный", weight: "80", quantity: QuantityType.milliliter)
        ]),
        Recipe(
            id: UUID().uuidString,
            name: "Пожарские котлеты",
            meal: .mainCourses,
            instruction: "Готовая 'пожарская' котлета в разрезе должна 'брызгаться' соком, иметь хрустящую корочку и благоухать сливочным ароматом. Подается с гарниром из картофеля или разнообразных овощей и соусом.",
            ingredients: [
                Ingredient(id: UUID().uuidString, name: "Курица средней величины", weight: "1", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Масло сливочное", weight: "100", quantity: QuantityType.gram),
                Ingredient(id: UUID().uuidString, name: "Хлеб белый ломтик", weight: "1", quantity: QuantityType.perPiece),
                Ingredient(id: UUID().uuidString, name: "Сливки ординарные (обычных 10%)", weight: "150", quantity: QuantityType.milliliter)
        ]),
    ]
}
