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
    
    func getMeals(type: MealType, completion: ([Meal]) -> Void) {
        let request = NSFetchRequest<MealEntity>(entityName: "MealEntity")
        request.predicate = NSPredicate(format: "type == %@", type.rawValue)
        do {
            let loadedMeals = try context?.fetch(request)
            guard let loadedMeals = loadedMeals else { return }
            
            var meals = [Meal]()
            
            for loadedMeal in loadedMeals {
                meals.append(Meal(mealEntity: loadedMeal))
            }
            
            completion(meals)
        } catch {
            print("Data Load Error: \(error)")
        }
    }
    
    func getMeal(id: String) -> MealEntity? {
        let request = NSFetchRequest<MealEntity>(entityName: "MealEntity")
        request.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let loadedMeal = try context?.fetch(request).first
            return loadedMeal
        } catch {
            print("Error Fetching Meal from data: \(error)")
        }
        
        return nil
    }
    
    func saveMeal(type: MealType, meal: Meal) {
        guard let context = context else {
            return
        }

        guard let meals = NSEntityDescription.entity(forEntityName: "MealEntity", in: context) else { return }
        let mealToSave = NSManagedObject(entity: meals, insertInto: context)
        
        mealToSave.setValue(type.rawValue, forKey: "type")
        mealToSave.setValue(type == .favorite ? meal.id : UUID().uuidString, forKey: "id")
        mealToSave.setValue(meal.name, forKey: "name")
        mealToSave.setValue(meal.instructions, forKey: "instructions")
        mealToSave.setValue(meal.imageURL, forKey: "imageURL")
        
        let ingredientsAsString = meal.ingredients.map { "\($0.name)#\($0.amount)"}
        mealToSave.setValue(ingredientsAsString, forKey: "ingredients")

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

