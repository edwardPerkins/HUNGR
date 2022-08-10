//
//  Meal.swift
//  hungr
//
//  Created by Kevin McKenney on 8/10/22.
//

import Foundation

struct Meal {
    
    let name: String
    let instructions: String
    let imageURL: String
    var ingredients: [Ingredient]
    
    init(model: MealModel) {
        name = model.strMeal
        instructions = model.strInstructions
        imageURL = model.strMealThumb
        ingredients = []
        
         let names = [
            model.strIngredient1,
            model.strIngredient2,
            model.strIngredient3,
            model.strIngredient4,
            model.strIngredient5,
            model.strIngredient6,
            model.strIngredient7,
            model.strIngredient8,
            model.strIngredient9,
            model.strIngredient10,
            model.strIngredient11,
            model.strIngredient12,
            model.strIngredient13,
            model.strIngredient14,
            model.strIngredient15,
            model.strIngredient16,
            model.strIngredient17,
            model.strIngredient18,
            model.strIngredient19,
            model.strIngredient20,
         ]
        
        let amounts = [
            model.strMeasure1,
            model.strMeasure2,
            model.strMeasure3,
            model.strMeasure4,
            model.strMeasure5,
            model.strMeasure6,
            model.strMeasure7,
            model.strMeasure8,
            model.strMeasure9,
            model.strMeasure10,
            model.strMeasure11,
            model.strMeasure12,
            model.strMeasure13,
            model.strMeasure14,
            model.strMeasure15,
            model.strMeasure16,
            model.strMeasure17,
            model.strMeasure18,
            model.strMeasure19,
            model.strMeasure20,
        ]
        
        for index in 1...20 {
            ingredients.append(Ingredient(name: names[index] ?? "", amount: amounts[index] ?? ""))
        }
        
        ingredients = ingredients.filter({ $0.name != "" })
        
    }
    
    struct Ingredient {
        let name: String
        let amount: String
    }
}
