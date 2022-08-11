//
//  SearchVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

class SearchVM {

    var mealList: Meals? {
        didSet{
            print("view model fired")
            update()
            
        }
    }
    
    var update: () -> Void = {}
    
    func getMealsByLetter(letter: String) {
        
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)"
        
        NetWorkManager.shared.fetchData(url: url) { (data: Meals?) in

            guard let data = data else { return }
            self.mealList = data
        }
    }
    
}
