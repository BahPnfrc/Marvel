//
//  NSObject+Extention.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 27/03/2022.
//

import Foundation

extension NSObject {
    var currentClassName: String {
        NSStringFromClass(Swift.type(of: self))
    }
    
}
