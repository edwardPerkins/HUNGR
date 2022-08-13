//
//  FavoritesHost.swift
//  hungr
//
//  Created by Kevin McKenney on 8/12/22.
//

import SwiftUI

class FavoritesHost: UIHostingController<FavoritesView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: FavoritesView())
    }
}

