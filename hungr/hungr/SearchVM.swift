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

    func getMeals(_ query: Query, completion: @escaping () -> Void) {
        NetWorkManager.shared.fetchData(url: query.url) { (data: Meals?) in
            self.mealList = data?.meals?.map { MealDetailsVM($0, group: self.group) }
            self.mealList?.forEach { _ in
                self.group.enter()
            }
            self.group.notify(queue: DispatchQueue.main) {
                completion()
            }
        }
    }
    
}
