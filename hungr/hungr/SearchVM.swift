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
    
//    func getRandomMeal(completion: @escaping (MealDetailsVM) -> Void) {
//        NetWorkManager.shared.fetchData(url: Query.random.url) { (data: Meals?) in
//            guard let meal = data?.meals?[0] else { return }
//            self.group.enter()
//            let vm = MealDetailsVM(meal, group: self.group)
//            self.group.notify(queue: <#T##DispatchQueue#>, work: <#T##DispatchWorkItem#>)
//            completion()
//        }
//    }

    
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
