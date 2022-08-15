//
//  MyMealsViewController.swift
//  hungr
//
//  Created by Joel Maldonado on 8/11/22.
//

import UIKit

class MyMealsViewController: UIViewController {

    @IBOutlet weak var mealsCollection: UICollectionView!
    
    let myMealsVM = MyMealsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureMealsCollection()
        myMealsVM.onChange = { [weak self] in
            DispatchQueue.main.async {
                self?.mealsCollection.reloadData()
            }
        }
        myMealsVM.getMeals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myMealsVM.getMeals()
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        let vc = CreateMealViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureMealsCollection() {
        let nib = UINib(nibName: "MyMealCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = .init(width: (view.bounds.width/2), height: (view.bounds.height/5))
        
        mealsCollection.register(nib, forCellWithReuseIdentifier: "MyMealCell")
        mealsCollection.collectionViewLayout = layout
        mealsCollection.dataSource = self
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
