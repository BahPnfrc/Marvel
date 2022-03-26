//
//  NSError+Extention.swift
//  Marvel
//
//  Created by Pierre-Alexandre on 27/03/2022.
//

import Foundation

extension NSError {
    public enum TroubleType: Int {
        case jsonWrongData = 10001
        case jsonMissingData = 10002
        
        case coreDataOperationIssue = 20001
        case coreDataMissingContext = 20002
        case coreDataMissingLinkedObject = 20003
        
        public var domain: String {
            switch self {
            case .jsonWrongData, .jsonMissingData:
                return "JsonErrorDomain"
            case .coreDataOperationIssue, .coreDataMissingContext, .coreDataMissingLinkedObject:
                return "CoreDataErrorDomain"
            }
        }
    }
    
    /// Initialize an error with convenient description.
    ///
    /// - Parameters:
    ///     - trouble: The *TroubleType* of the error.
    ///     - description: The NSLocalizedDescriptionKey value.
    ///     - failureReason: The NSLocalizedFailureErrorKey value.
    ///     - underlyingError: The NSUnderlyingErrorKey value.
    convenience init(trouble: TroubleType, description: String, failureReason: String = "", underlyingError: Error? = nil) {
        var dic: [String: Any] = [:]
        dic[NSLocalizedDescriptionKey] = description.localizedString
        dic[NSLocalizedFailureErrorKey] = failureReason.localizedString
        dic[NSUnderlyingErrorKey] = underlyingError
        
        self.init(domain: trouble.domain, code: trouble.rawValue, userInfo: dic)
        #if DEBUG
        print(self)
        #endif
    }
    
}
