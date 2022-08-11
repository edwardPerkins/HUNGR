//
//  SearchVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

class SearchVM{
    var mealList: Meals!
    
    
    
    func getRandomMeal() -> MealDetailsVM? {
        MealDetailsVM(mealList.meals.randomElement())
    }
    
}
