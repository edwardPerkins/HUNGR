//
//  MyMealsViewModel.swift
//  hungr
//
//  Created by Joel Maldonado on 8/11/22.
//

import Foundation

class MyMealsViewModel: MealDeletable {
    var mealViewModels = [MealDetailsVM]() {
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
            self.mealViewModels = meals.map { MealDetailsVM($0) }
        }
    }
    
    func getMealVM(at index: Int) -> MealDetailsVM {
        mealViewModels[index]
    }
    
    func deleteMeal(id: String) {
        DataManager.shared.deleteMeal(id: id)
        getMeals()
    }
}
