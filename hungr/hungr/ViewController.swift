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
    @IBOutlet weak var searchField: UITextField!

    
    let viewModel = SearchVM()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SearchByLetterViewController
        vc?.viewModel = self.viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
    }
    
    func configureTable() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        mainTableView.register(nib, forCellReuseIdentifier: "Cell")
    }

    
    @IBAction func onQuery(_ sender: UIButton) {
        var query = Query.random
        
        if sender.tag == 0 {
            guard let term = searchField?.text else { return }
            query = Query.search("s", term)
        }
        viewModel.getMeals(query) {
            switch query {
            case .search:
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            case .random:
                guard let destinationVM = self.viewModel.getDestinationVM(at: 0) else { return }
                DispatchQueue.main.async {
                    let host = UIHostingController(rootView: MealDetailsView(vm: destinationVM))
                    self.navigationController?.pushViewController(host, animated: true)
                }
            }
        }
    }
}





