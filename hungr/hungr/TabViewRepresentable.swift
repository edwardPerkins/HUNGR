//
//  TabViewRepresentable.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

struct TabViewRepresentable: UIViewControllerRepresentable {

    typealias UIViewControllerType = TabViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<TabViewRepresentable>) -> TabViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "TabVC") as! TabViewController
    
        return viewController
    }

    func updateUIViewController(_ uiViewController: TabViewRepresentable.UIViewControllerType, context: UIViewControllerRepresentableContext<TabViewRepresentable>) {
        
    }
}
