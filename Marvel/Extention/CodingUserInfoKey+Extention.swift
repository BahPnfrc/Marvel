//
//  CodingUserInfoKey+Extention.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 27/03/2022.
//

import Foundation

public extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
    static let decodingContext = CodingUserInfoKey(rawValue: "decodingContext")
    
}
