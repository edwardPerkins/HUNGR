//
//  TableViewCell.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageLabel: UIImageView!
    @IBOutlet weak var favoriteOutlet: UIButton!
    
    var cellVM: MealVM?
    var favoriteEditableDelegate: FavoriteEditable?
    
    override func awakeFromNib() {
        favoriteOutlet.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteOutlet.setImage(UIImage(systemName: "star.fill"), for: .selected)
    }
    
    func configure(_ vm: MealVM) {
        recipeTitleLabel.text = vm.name
        recipeImageLabel.image = UIImage(data: vm.imageData)
        favoriteOutlet.isSelected = vm.isFavorite
        cellVM = vm
    }
    
    @IBAction func onClickFavorite(_ sender: Any) {
        guard let cellVM = cellVM else { return }
        if cellVM.isFavorite {
            favoriteEditableDelegate?.removeFromFavorites(cellVM.meal)
        } else {
            favoriteEditableDelegate?.addToFavorites(cellVM.meal)
        }
        favoriteOutlet.isSelected.toggle()
        cellVM.isFavorite.toggle()
    }
    
    
}
