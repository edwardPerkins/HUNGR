//
//  MealDetailsHost.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

class MealDetailsHost: UIHostingController<MealDetailsView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: MealDetailsView())
        
    }
}
