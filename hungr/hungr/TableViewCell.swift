//
//  TableViewCell.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageLabel: UIImage!
    @IBOutlet weak var favoriteOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
