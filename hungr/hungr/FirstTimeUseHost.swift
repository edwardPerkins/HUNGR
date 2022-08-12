//
//  FirstTimeUseHost.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import SwiftUI

class FirstTimeUseHost: UIHostingController<FirstTimeUseView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: FirstTimeUseView())
        
    }
}
