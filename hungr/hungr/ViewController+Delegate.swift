//
//  ViewController+Delegate.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import SwiftUI

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let destinationVM = viewModel.getDestinationVM(at: indexPath.row) else { return }
        let destination = MealDetailsView(vm: destinationVM)
        let host = UIHostingController(rootView: destination)
        navigationController?.pushViewController(host, animated: true)
    }
}
