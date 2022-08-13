//
//  MealVM.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation


class MealVM {
    
    init(_ meal: Meal, group: DispatchGroup?) {
        self.meal = meal
        imageData = Data()
        
        NetWorkManager.shared.fetchImageData(url: meal.imageURL) { data in
            self.imageData = data
            group?.leave()
        }
    }
    
    var isFavorite = false
    
    private(set) var meal: Meal
    
    var id: String { meal.id ?? ""}
    
    var name: String { meal.name }
    
    var ingredients: [Meal.Ingredient] { meal.ingredients }
    
    var instructions: String { meal.instructions }
    
    var imageData: Data
}
