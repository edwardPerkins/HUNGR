//
//  SearchVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

class SearchVM: ObservableObject {
    
    init() {
        DataManager.shared.getMeals(type: .favorite) { meals in
            self.favorites = meals.map { MealVM($0, group: nil) }
        }
    }

    private var mealList: [MealVM]?
    
    var group = DispatchGroup()
    
    var mealCount: Int { mealList?.count ?? 0 }
    
    func getDestinationVM(at index: Int) -> MealVM? {
        mealList?[index]
    }

    func getMeals(_ query: Query, completion: @escaping () -> Void) {
        NetWorkManager.shared.fetchData(url: query.url) { (data: Meals?) in
            self.mealList = data?.meals?.map { MealVM($0, group: self.group) }
            self.mealList?.forEach { meal in
                self.group.enter()
                if self.favorites.contains(where: { $0.meal.id == meal.id }) {
                    meal.isFavorite = true
                }
            }
            self.group.notify(queue: DispatchQueue.main) {
                completion()
            }
        }
    }
    
    @Published var favorites: [MealVM] = []
    
    func delete(at offset: IndexSet) {
        guard let index = offset.first else { return }
        let favorite = favorites[index].meal
        if let meal = mealList?.first(where: { $0.meal.id == favorite.id }) {
            meal.isFavorite = false
        }
        removeFromFavorites(favorite)
    }
}
