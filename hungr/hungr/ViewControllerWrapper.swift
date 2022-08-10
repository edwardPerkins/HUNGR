//
//  ViewControllerWrapper.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    
    init() {
        UserDefaults.standard.set(true, forKey: "usedBefore")
        print("set to true")
    }

    typealias UIViewControllerType = ViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        
        return viewController
    }

    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }
}
