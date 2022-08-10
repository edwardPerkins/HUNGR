//
//  ViewController.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        
        DataManager.shared.getFavMeals { loadedMeals in
            for meal in loadedMeals {
                print(meal)
            }
        }
        
        configureTable()
    }
    
    func configureTable() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        mainTableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell {
//            cell.recipeImageLabel.text = MealModel.strMeal
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of rows
        10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: find a way to navigate to a SwiftUI view when cell is tapped
        
        // MARK: method 1:
        let destination = MealDetailsView()
        let host = UIHostingController(rootView: destination)
        navigationController?.pushViewController(host, animated: true)
        
        // MARK: method 2:
//        let destinationViewController = navigationController?.storyboard?.instantiateViewControllerWithIdentifier("MealDetailsView") as? KevinsViewController
//        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
}


extension ViewController: UITableViewDelegate {
    
    // height for each row:
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        190
    }
    
}
