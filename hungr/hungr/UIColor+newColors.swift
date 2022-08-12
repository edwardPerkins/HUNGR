//
//  UIColor+newColors.swift
//  hungr
//
//  Created by Maher Damouni on 8/9/22.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
    
    static let Background = UIColor(named: "background")
    static let TextColor = UIColor(named: "textColor")
    static let AccentOne = UIColor(named: "accentOne")
    static let AccentTwo = UIColor(named: "accentTwo")
}

extension Color {
    static let background = Color(uiColor: .Background ?? .clear)
    static let textColor = Color(uiColor: .TextColor ?? .clear)
    static let accent1 = Color(uiColor: .AccentOne ?? .clear)
    static let accent2 = Color(uiColor: .AccentTwo ?? .clear)
}

extension Image {
    init(data: Data) {
        self.init(uiImage: UIImage(data: data) ?? UIImage())
    }
}
