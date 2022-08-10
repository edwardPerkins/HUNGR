//
//  ViewController.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit

class ViewController: UIViewController {

    var mealList: Meals? {
        didSet {
            print(mealList?.meals[0].name, mealList?.meals[0].ingredients)
        }
    }
    let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
    override func viewDidLoad() {
                
        super.viewDidLoad()
        
//        DataManager.shared.getFavMeals { loadedMeals in
//            for meal in loadedMeals {
//                print(meal)
//            }
//        }
        
            NetWorkManager.shared.fetchData(url: urlString) { meals in
                self.mealList = meals
            
            }
    }
}


