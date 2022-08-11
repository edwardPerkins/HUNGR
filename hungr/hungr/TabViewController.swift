//
//  TabViewController.swift
//  hungr
//
//  Created by Kevin McKenney on 8/10/22.
//

import Foundation
import UIKit

class TabViewController: UITabBarController {
    override func viewDidLoad() {
        print("used already was", UserDefaults.standard.bool(forKey: "usedAlready"))
        UserDefaults.standard.set(true, forKey: "usedAlready")
        print("used already set to", UserDefaults.standard.bool(forKey: "usedAlready"))
    }
}
