//
//  SearchByLetterViewController.swift
//  hungr
//
//  Created by Maher Damouni on 8/11/22.
//

import UIKit

class SearchByLetterViewController: UIViewController {
    
    var viewModel: SearchVM?


    @IBAction func letterButton(_ sender: UIButton) {
        
        guard let letter = sender.titleLabel?.text?.lowercased() else { return }
        let query = Query.search("f", letter)

        guard let viewModel = viewModel else { return }
        viewModel.getMeals(query) {
            DispatchQueue.main.async { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
