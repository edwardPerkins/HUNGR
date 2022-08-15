//
//  MyMealsViewModel.swift
//  hungr
//
//  Created by Joel Maldonado on 8/11/22.
//

import Foundation

class MyMealsViewModel: MealDeletable {
    var mealViewModels = [MealVM]() {
        didSet {
            onChange()
        }
    }
    
    var numMeals: Int {
        mealViewModels.count
    }
    
    var onChange: () -> Void = {}
    
    func getMeals() {
        DataManager.shared.getMeals(type: .custom) { meals in
            self.mealViewModels = meals.map { MealVM($0, group: nil) }
        }
    }
    
    func getMealVM(at index: Int) -> MealVM {
        mealViewModels[index]
    }
    
    func deleteMeal(id: String) {
        DataManager.shared.deleteMeal(id: id)
        getMeals()
    }
}
