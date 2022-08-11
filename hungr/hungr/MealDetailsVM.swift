//
//  MealDetailsVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation


class MealDetailsVM{
    let meal: Meal? = nil
    
    
    var listheight: Int {
        min(ingrediants.count * 43, 215)
    }
    
    var name: String = "Spicy Arrabiata Penne"
    
    var ingrediants: [Ingrediant] = [
        Ingrediant(name: "penne rigate", amount: "1 pound"),
        Ingrediant(name: "olive oil", amount: "1/4 cup"),
        Ingrediant(name: "garlic", amount: "3 cloves")
    ]
    
    var instructions: String = "Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.\r\nIn a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.\r\nDrain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm."
    
    struct Ingrediant: Hashable {
        let name: String
        let amount: String
        
        init(name: String, amount: String) {
            self.name = name
            self.amount = amount
        }
    }
}
