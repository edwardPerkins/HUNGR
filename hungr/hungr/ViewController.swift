//
//  ViewController.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = SearchVM()

    @IBAction func letterButton(_ sender: UIButton) {
        
        guard let label = sender.titleLabel?.text?.lowercased() else { return }
        viewModel.getMealsByLetter(letter: label) {
            print("RECIPE COUNT", self.viewModel.mealModel?.count)
        }
    }
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        
        
        DataManager.shared.getFavMeals { loadedMeals in
            for meal in loadedMeals {
                print(meal)
            }
        }
    }
    
    
}


