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
    
    let viewModel = SearchVM()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SearchByLetterViewController
        vc?.viewModel = self.viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.update = {
            
            DispatchQueue.main.async { [weak self] in
                self?.mainTableView.reloadData()
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
    
//    @IBAction func onClickFeelingLucky(_ sender: Any) {
//        let host = UIHostingController(rootView: MealDetailsView(vm: <#MealDetailsVM#>))
//        navigationController?.pushViewController(host, animated: true)
//    }
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
        let destinationVM = viewModel.getDestinationVM(at: indexPath.row)
        let destination = MealDetailsView(vm: destinationVM)
        let host = UIHostingController(rootView: destination)
        navigationController?.pushViewController(host, animated: true)
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
    // height for each row:
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        190
    }
    
}
