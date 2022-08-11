//
//  Meal.swift
//  hungr
//
//  Created by Kevin McKenney on 8/10/22.
//

import Foundation

extension Meal: Decodable {
    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        id = try data.decode(String.self, forKey: .idMeal)
        name = try data.decode(String.self, forKey: .strMeal)
        instructions = try data.decode(String.self, forKey: .strInstructions)
        imageURL = try data.decode(String.self, forKey: .strMealThumb)
        ingredients = []
        
        let strIngredient1 = try data.decode(Optional<String>.self, forKey: .strIngredient1)
        let strIngredient2 = try data.decode(Optional<String>.self, forKey: .strIngredient2)
        let strIngredient3 = try data.decode(Optional<String>.self, forKey: .strIngredient3)
        let strIngredient4 = try data.decode(Optional<String>.self, forKey: .strIngredient4)
        let strIngredient5 = try data.decode(Optional<String>.self, forKey: .strIngredient5)
        let strIngredient6 = try data.decode(Optional<String>.self, forKey: .strIngredient6)
        let strIngredient7 = try data.decode(Optional<String>.self, forKey: .strIngredient7)
        let strIngredient8 = try data.decode(Optional<String>.self, forKey: .strIngredient8)
        let strIngredient9 = try data.decode(Optional<String>.self, forKey: .strIngredient9)
        let strIngredient10 = try data.decode(Optional<String>.self, forKey: .strIngredient10)
        let strIngredient11 = try data.decode(Optional<String>.self, forKey: .strIngredient11)
        let strIngredient12 = try data.decode(Optional<String>.self, forKey: .strIngredient12)
        let strIngredient13 = try data.decode(Optional<String>.self, forKey: .strIngredient13)
        let strIngredient14 = try data.decode(Optional<String>.self, forKey: .strIngredient14)
        let strIngredient15 = try data.decode(Optional<String>.self, forKey: .strIngredient15)
        let strIngredient16 = try data.decode(Optional<String>.self, forKey: .strIngredient16)
        let strIngredient17 = try data.decode(Optional<String>.self, forKey: .strIngredient17)
        let strIngredient18 = try data.decode(Optional<String>.self, forKey: .strIngredient18)
        let strIngredient19 = try data.decode(Optional<String>.self, forKey: .strIngredient19)
        let strIngredient20 = try data.decode(Optional<String>.self, forKey: .strIngredient20)
        let strMeasure1 = try data.decode(Optional<String>.self, forKey: .strMeasure1)
        let strMeasure2 = try data.decode(Optional<String>.self, forKey: .strMeasure2)
        let strMeasure3 = try data.decode(Optional<String>.self, forKey: .strMeasure3)
        let strMeasure4 = try data.decode(Optional<String>.self, forKey: .strMeasure4)
        let strMeasure5 = try data.decode(Optional<String>.self, forKey: .strMeasure5)
        let strMeasure6 = try data.decode(Optional<String>.self, forKey: .strMeasure6)
        let strMeasure7 = try data.decode(Optional<String>.self, forKey: .strMeasure7)
        let strMeasure8 = try data.decode(Optional<String>.self, forKey: .strMeasure8)
        let strMeasure9 = try data.decode(Optional<String>.self, forKey: .strMeasure9)
        let strMeasure10 = try data.decode(Optional<String>.self, forKey: .strMeasure10)
        let strMeasure11 = try data.decode(Optional<String>.self, forKey: .strMeasure11)
        let strMeasure12 = try data.decode(Optional<String>.self, forKey: .strMeasure12)
        let strMeasure13 = try data.decode(Optional<String>.self, forKey: .strMeasure13)
        let strMeasure14 = try data.decode(Optional<String>.self, forKey: .strMeasure14)
        let strMeasure15 = try data.decode(Optional<String>.self, forKey: .strMeasure15)
        let strMeasure16 = try data.decode(Optional<String>.self, forKey: .strMeasure16)
        let strMeasure17 = try data.decode(Optional<String>.self, forKey: .strMeasure17)
        let strMeasure18 = try data.decode(Optional<String>.self, forKey: .strMeasure18)
        let strMeasure19 = try data.decode(Optional<String>.self, forKey: .strMeasure19)
        let strMeasure20 = try data.decode(Optional<String>.self, forKey: .strMeasure20)
        
        let names = [
            strIngredient1,
            strIngredient2,
            strIngredient3,
            strIngredient4,
            strIngredient5,
            strIngredient6,
            strIngredient7,
            strIngredient8,
            strIngredient9,
            strIngredient10,
            strIngredient11,
            strIngredient12,
            strIngredient13,
            strIngredient14,
            strIngredient15,
            strIngredient16,
            strIngredient17,
            strIngredient18,
            strIngredient19,
            strIngredient20,
        ]
        
        let amounts = [
            strMeasure1,
            strMeasure2,
            strMeasure3,
            strMeasure4,
            strMeasure5,
            strMeasure6,
            strMeasure7,
            strMeasure8,
            strMeasure9,
            strMeasure10,
            strMeasure11,
            strMeasure12,
            strMeasure13,
            strMeasure14,
            strMeasure15,
            strMeasure16,
            strMeasure17,
            strMeasure18,
            strMeasure19,
            strMeasure20,
        ]
    
        for index in 0...19 {
            ingredients.append(Ingredient(name: names[index] ?? "", amount: amounts[index] ?? ""))
        }
        
        ingredients = ingredients.filter { $0.name != "" }
    }
}
