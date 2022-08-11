//
//  SearchVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

class SearchVM {

    var mealList: [MealDetailsVM]!
    
    var update: () -> Void = {}
    
    
    func getDestinationVM(at index: Int) -> MealDetailsVM {
        mealList[index]
    }
    
    func getMealsByLetter(letter: String, completion: @escaping () -> Void) {

        
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)"
        
        NetWorkManager.shared.fetchData(url: url) { (data: Meals?) in

            guard let data = data else { return }

            self.mealList = data.meals?.map { MealDetailsVM($0) }
            completion()
        }
    }
    
}
