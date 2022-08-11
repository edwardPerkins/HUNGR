//
//  Model.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

struct Meals: Decodable {
    var meals: [Meal]?
}

struct Meal {
    let id: String
    let name: String
    let instructions: String
    let imageURL: String
    var ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strInstructions
        case strMealThumb
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }

    struct Ingredient {
        let name: String
        let amount: String
    }
}
