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





