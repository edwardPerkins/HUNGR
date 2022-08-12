//
//  StringConstants.swift
//  hungr
//
//  Created by Rave Bizz on 8/8/22.
//

import Foundation

/// Use enum raw values to store any string value used in the app to avoid errors and stream line updating
enum Query {
    case search(String, String)
    case random
    
    var url: String {
        switch self {
        case .search(let parameter, let term):
            return "https://www.themealdb.com/api/json/v1/1/search.php?" + parameter + "=" + term
        case .random:
            return "https://www.themealdb.com/api/json/v1/1/random.php"
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


