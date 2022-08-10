//
//  DataManger.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation
import UIKit
import CoreData

final class DataManager{
    static let shared = DataManager()
    
    private let context: NSManagedObjectContext?
    
    private init() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        self.context = delegate?.persistentContainer.viewContext
    }
    
    func getMeals(type: MealType, completion: ([MealModel]) -> Void) {
        let request = NSFetchRequest<MealEntity>(entityName: "MealEntity")
        request.predicate = NSPredicate(format: "type == %@", type.rawValue)
        do {
            let meals = try context?.fetch(request)
            guard let meals = meals else { return }
            
            var mealModels = [MealModel]()
            
            for meal in meals {
                mealModels.append(MealModel(mealEntity: meal))
            }
            
            completion(mealModels)
        } catch {
            print("Data Load Error: \(error)")
        }
    }
    
    func getMeal(id: String) -> MealEntity? {
        let request = NSFetchRequest<MealEntity>(entityName: "MealEntity")
        request.predicate = NSPredicate(format: "idMeal == %@", id)
        
        do {
            let loadedMeal = try context?.fetch(request).first
            return loadedMeal
        } catch {
            print("Error Fetching Meal from data: \(error)")
        }
        
        return nil
    }
    
    func saveMeal(type: MealType, meal: MealModel) {
        guard let context = context else {
            return
        }

        guard let meals = NSEntityDescription.entity(forEntityName: "MealEntity", in: context) else { return }
        let mealToSave = NSManagedObject(entity: meals, insertInto: context)
        
        mealToSave.setValue(type.rawValue, forKey: "type")
        mealToSave.setValue(type == .favorite ? meal.idMeal : UUID().uuidString, forKey: "idMeal")
        mealToSave.setValue(meal.strMeal, forKey: "strMeal")
        mealToSave.setValue(meal.strInstructions, forKey: "strInstructions")
        mealToSave.setValue(meal.strMealThumb, forKey: "strMealThumb")
        mealToSave.setValue(meal.strIngredient1, forKey: "strIngredient1")
        mealToSave.setValue(meal.strIngredient2, forKey: "strIngredient2")
        mealToSave.setValue(meal.strIngredient3, forKey: "strIngredient3")
        mealToSave.setValue(meal.strIngredient4, forKey: "strIngredient4")
        mealToSave.setValue(meal.strIngredient5, forKey: "strIngredient5")
        mealToSave.setValue(meal.strIngredient6, forKey: "strIngredient6")
        mealToSave.setValue(meal.strIngredient7, forKey: "strIngredient7")
        mealToSave.setValue(meal.strIngredient8, forKey: "strIngredient8")
        mealToSave.setValue(meal.strIngredient9, forKey: "strIngredient9")
        mealToSave.setValue(meal.strIngredient10, forKey: "strIngredient10")
        mealToSave.setValue(meal.strIngredient11, forKey: "strIngredient11")
        mealToSave.setValue(meal.strIngredient12, forKey: "strIngredient12")
        mealToSave.setValue(meal.strIngredient13, forKey: "strIngredient13")
        mealToSave.setValue(meal.strIngredient14, forKey: "strIngredient14")
        mealToSave.setValue(meal.strIngredient15, forKey: "strIngredient15")
        mealToSave.setValue(meal.strIngredient16, forKey: "strIngredient16")
        mealToSave.setValue(meal.strIngredient17, forKey: "strIngredient17")
        mealToSave.setValue(meal.strIngredient18, forKey: "strIngredient18")
        mealToSave.setValue(meal.strIngredient19, forKey: "strIngredient19")
        mealToSave.setValue(meal.strIngredient20, forKey: "strIngredient20")
        mealToSave.setValue(meal.strMeasure1, forKey: "strMeasure1")
        mealToSave.setValue(meal.strMeasure2, forKey: "strMeasure2")
        mealToSave.setValue(meal.strMeasure3, forKey: "strMeasure3")
        mealToSave.setValue(meal.strMeasure4, forKey: "strMeasure4")
        mealToSave.setValue(meal.strMeasure5, forKey: "strMeasure5")
        mealToSave.setValue(meal.strMeasure6, forKey: "strMeasure6")
        mealToSave.setValue(meal.strMeasure7, forKey: "strMeasure7")
        mealToSave.setValue(meal.strMeasure8, forKey: "strMeasure8")
        mealToSave.setValue(meal.strMeasure9, forKey: "strMeasure9")
        mealToSave.setValue(meal.strMeasure10, forKey: "strMeasure10")
        mealToSave.setValue(meal.strMeasure11, forKey: "strMeasure11")
        mealToSave.setValue(meal.strMeasure12, forKey: "strMeasure12")
        mealToSave.setValue(meal.strMeasure13, forKey: "strMeasure13")
        mealToSave.setValue(meal.strMeasure14, forKey: "strMeasure14")
        mealToSave.setValue(meal.strMeasure15, forKey: "strMeasure15")
        mealToSave.setValue(meal.strMeasure16, forKey: "strMeasure16")
        mealToSave.setValue(meal.strMeasure17, forKey: "strMeasure17")
        mealToSave.setValue(meal.strMeasure18, forKey: "strMeasure18")
        mealToSave.setValue(meal.strMeasure19, forKey: "strMeasure19")
        mealToSave.setValue(meal.strMeasure20, forKey: "strMeasure20")

        do {
            try context.save()
        } catch {
            print("Save error: \(error)")
        }
    }
    
    func deleteMeal(id: String) {
        let mealToDelete = getMeal(id: id)
        
        guard let mealToDelete = mealToDelete else {
            return
        }

        context?.delete(mealToDelete)
        
        do {
            try context?.save()
        } catch {
            print("Save Error after deleting: \(error)")
        }
    }
}

enum MealType: String {
    case favorite
    case custom
}

