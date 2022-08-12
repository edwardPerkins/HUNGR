//
//  StringConstants.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

/// Use enum raw values to store any string value used in the app to avoid errors and stream line updating
enum Query {
    case search(String)
    case firstLetter(String)
    case random
    
    var url: String {
        let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
        switch self {
        case .search(let term):
            return  baseUrl + "search.php?s=" + term
        case .firstLetter(let letter):
            return  baseUrl + "search.php?f=" + letter
        case .random:
            return baseUrl + "random.php"
        }
    }
}

enum FirstTimeUse: String {
    case thankYouMessage = "Thank you for downloading Hunger. I hope we can help you prepare tasty meals for a healthier tomorrow. Follow us on Instagram @HUNGR"
}

enum Alerts {
    
}

enum ButtonText {
    
}


