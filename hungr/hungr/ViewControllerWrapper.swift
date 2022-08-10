//
//  ViewControllerWrapper.swift
//  hungr
//
//  Created by Kevin McKenney on 8/9/22.
//

import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = ViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        
        return viewController
    }

    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }
}
