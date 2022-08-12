//
//  SearchVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

class SearchVM {

    private var mealList: [MealDetailsVM]?
    
    var group = DispatchGroup()
    
    var mealCount: Int { mealList?.count ?? 0 }
    
    func getDestinationVM(at index: Int) -> MealDetailsVM? {
        mealList?[index]
    }
    
    
    
    func getMealsByLetter(_ letterToSearch: String, completion: @escaping () -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letterToSearch)"
        
        NetWorkManager.shared.fetchData(url: url) { (data: Meals?) in

            guard let data = data else { return }
            
            self.mealList = data.meals?.map { MealDetailsVM($0, group: self.group) }
            self.mealList?.forEach { _ in
                self.group.enter()
            }
            self.group.notify(queue: DispatchQueue.main) {
                completion()
            }
        }
    }
    
}
