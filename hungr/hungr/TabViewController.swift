//
//  TabViewController.swift
//  hungr
//
//  Created by Kevin McKenney on 8/10/22.
//

import Foundation
import SwiftUI

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    var viewmodel: SearchVM?
    
    override func viewDidLoad() {
        print("used already was", UserDefaults.standard.bool(forKey: "usedAlready"))
        UserDefaults.standard.set(true, forKey: "usedAlready")
        print("used already set to", UserDefaults.standard.bool(forKey: "usedAlready"))
        self.delegate = self
        
    }

}

