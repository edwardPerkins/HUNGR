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
    
    var viewModel: SearchVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tabVC = tabBarController as? TabViewController else { return }
        viewModel = tabVC.viewmodel
        configureTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SearchByLetterViewController
        vc?.viewModel = self.viewModel
    }

    private func configureTable() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        mainTableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func onClickFeelingLucky(_ sender: Any) {
        viewModel.getMeals(Query.random) {
            guard let destinationVM = self.viewModel.getDestinationVM(at: 0) else { return }
            DispatchQueue.main.async {
                let host = UIHostingController(rootView: MealDetailsView(viewModel: destinationVM))
                self.navigationController?.pushViewController(host, animated: true)
            }
        }
    }
    
    @IBAction func onClickSearch(_ sender: UIButton) {
        guard let term = searchField?.text else { return }
        viewModel.getMeals(Query.search(term)) {
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
}





