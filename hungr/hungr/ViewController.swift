//
//  ViewController.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    var mealList: Meals?
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
    @IBAction func onClickFeelingLucky(_ sender: Any) {
        let host = UIHostingController(rootView: MealDetailsView())
        navigationController?.pushViewController(host, animated: true)
    }
}


