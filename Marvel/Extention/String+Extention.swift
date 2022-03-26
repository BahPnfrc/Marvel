//
//  String+Extention.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 27/03/2022.
//

import Foundation

extension String {
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func toDate(_ locale: Locale = .init(identifier: "FR-fr"), _ format: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
        let f = DateFormatter()
        f.locale = locale
        f.dateFormat = format
        return f.date(from: self)
    }
    
}
