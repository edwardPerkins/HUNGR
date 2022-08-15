//
//  MyMealCell.swift
//  hungr
//
//  Created by Joel Maldonado on 8/11/22.
//

import UIKit

protocol MealDeletable {
    func deleteMeal(id: String)
}

class MyMealCell: UICollectionViewCell {
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var cellVM: MealVM? {
        didSet {
            DispatchQueue.main.async {
                self.nameLabel.text = self.cellVM?.name ?? "??"
            }
        }
    }
    
    var deleteDelegate: MealDeletable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let id = cellVM?.meal.id else {
            return
        }
        
        deleteDelegate?.deleteMeal(id: id)
    }
    
    func configure(vm: MealVM) {
        cellVM = vm
        getImage(url: cellVM?.meal.imageURL)
    }
    
    func getImage(url: String?) {
        guard let url = url else {
            return
        }

        NetWorkManager.shared.fetchImageData(url: url) { data in
            DispatchQueue.main.async {
                self.mealImageView.image = UIImage(data: data)
            }
        }
    }
}
