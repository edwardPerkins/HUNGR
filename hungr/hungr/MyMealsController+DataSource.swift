//
//  MyMealsController+DataSource.swift
//  hungr
//
//  Created by Joel Maldonado on 8/11/22.
//

import UIKit

extension MyMealsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myMealsVM.numMeals
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mealsCollection.dequeueReusableCell(withReuseIdentifier: "MyMealCell", for: indexPath) as? MyMealCell else {
            return UICollectionViewCell()
        }
        
        cell.deleteDelegate = myMealsVM
        cell.configure(vm: myMealsVM.getMealVM(at: indexPath.row))
        
        return cell
    }
}
