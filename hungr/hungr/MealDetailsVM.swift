//
//  MealDetailsVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation


class MealDetailsVM{
    
    init(_ meal: Meal) {
        name = meal.name
        instructions = meal.instructions
        ingredients = meal.ingredients
    }
    
    
    var listheight: Int {
        min(ingredients.count * 43, 215)
    }
    
    var name: String
    
    var ingredients: [Meal.Ingredient]
    
    var instructions: String
    
}
