//
//  SearchVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

class SearchVM{
    
    var mealModel: [MealModel]? = nil
    
    func getMealsByLetter(letter: String, completion: @escaping () -> Void) {
        
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)"
        
        NetWorkManager.shared.fetchData(url: url) { (data: MealsModel?) in
            
            guard let data = data else { return }
            self.mealModel = data.meals
            completion()
        }
    }
}
