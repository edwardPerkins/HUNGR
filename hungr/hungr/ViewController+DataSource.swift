//
//  ViewController+DataSource.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell {
            guard let cellVM = viewModel.getDestinationVM(at: indexPath.row) else { return TableViewCell() }
            cell.configure(cellVM)
            cell.favoriteEditableDelegate = viewModel
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of rows
        viewModel.mealCount

    }
    
    // height for each row:
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        190
    }

}
