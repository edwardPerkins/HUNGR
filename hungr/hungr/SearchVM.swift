//
//  SearchVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

class SearchVM{
    
//    var mealModel: [MealModel]? = nil

    var mealList: Meals!
    
    
    
    func getRandomMeal() -> MealDetailsVM? {
        MealDetailsVM(mealList.meals.randomElement())
    }
    
    func getMealsByLetter(letter: String, completion: @escaping () -> Void) {
        
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)"
        
        NetWorkManager.shared.fetchData(url: url) { (data: Meals?) in

            guard let data = data else { return }
            self.mealList.meals = data.meals
            completion()
        }
    }
}
