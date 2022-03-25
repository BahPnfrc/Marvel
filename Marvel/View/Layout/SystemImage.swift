//
//  Shared.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 25/03/2022.
//

import Foundation
import UIKit


class SystemImage {
    enum Color {
        case tabBarIcon
        var value: (UIColor, UIColor, UIColor) {
            switch self {
            case .tabBarIcon: return (.black, .black, .black)
            }
        }
    }

    enum Name: String {
        case firstTab = "book"
        case secondTab = "bookmark"
        case thirdTab = "signature"
    }
    
    /// Create a painted image from iOS stock icons.
    static func painted(_ name: Name, _ color: Color) -> UIImage? {
        let config = UIImage.SymbolConfiguration(paletteColors: [color.value.0, color.value.1, color.value.2])
        let image = UIImage(systemName: name.rawValue)
        return image?.applyingSymbolConfiguration(config)
    }
                                                 
}
