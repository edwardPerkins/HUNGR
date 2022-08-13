//
//  SearchVM+FavoriteEditable.swift
//  hungr
//
//  Created by Kevin McKenney on 8/12/22.
//

import Foundation

extension SearchVM: FavoriteEditable {
    func addToFavorites(_ meal: Meal) {
        favorites.append(MealVM(meal, group: nil))
        DataManager.shared.saveMeal(type: .favorite, meal: meal)
    }
    
    func removeFromFavorites(_ meal: Meal) {
        favorites.removeAll(where: { $0.meal.id == meal.id })
        DataManager.shared.deleteMeal(id: meal.id ?? "")
    }
}

protocol FavoriteEditable {
    func addToFavorites(_ meal: Meal)
    func removeFromFavorites(_ meal: Meal)
}
