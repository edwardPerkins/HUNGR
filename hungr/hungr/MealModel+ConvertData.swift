//
//  MealModel+ConvertData.swift
//  hungr
//
//  Created by Joel Maldonado on 8/9/22.
//

import Foundation

extension Meal {
    init(mealEntity: MealEntity) {
        id = mealEntity.id ?? ""
        name = mealEntity.name ?? ""
        instructions = mealEntity.instructions ?? ""
        imageURL = mealEntity.imageURL ?? ""
        ingredients = []
        if let loadedIngredients = mealEntity.ingredients {
            for ingredient in loadedIngredients {
                let splitString = ingredient.split(separator: "#")
                let ingName = splitString[0]
                let ingAmount = splitString[1]
                self.ingredients.append(Ingredient(name: String(ingName), amount: String(ingAmount)))
            }
        }
    }
}
