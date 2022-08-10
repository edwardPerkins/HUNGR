//
//  ViewController.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
                
        super.viewDidLoad()
        
        DataManager.shared.getFavMeals { loadedMeals in
            for meal in loadedMeals {
                print(meal)
            }
        }
    }
}

