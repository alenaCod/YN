//
//  NSError.swift
//  YN
//
//  Created by Viktor Pechersky on 03.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation



// MARK: - NSError
public enum ErrorType: Int {
    case unknown = 1
    case success = 200
    
    func localizedUserInfo(description: Any?) -> [String: String] {
        var localizedDescription: String = ""
        let localizedFailureReasonError: String = ""
        let localizedRecoverySuggestionError: String = ""
        
        let comment = "Error.\(String(describing: self).capitalized)"
        
        if let data = description as? [String: Any], let detail = data["detail"] as? String {
            localizedDescription = NSLocalizedString(detail, comment: comment)
        } else {
            switch self {
            case .unknown:
                localizedDescription = NSLocalizedString("Unknown error", comment: comment)
            case .success:
                localizedDescription = NSLocalizedString("Success", comment: comment)
            }
        }
        return [
            NSLocalizedDescriptionKey: localizedDescription,
            NSLocalizedFailureReasonErrorKey: localizedFailureReasonError,
            NSLocalizedRecoverySuggestionErrorKey: localizedRecoverySuggestionError
        ]
    }
}

public let ProjectErrorDomain = "PlayerErrorDomain"

extension NSError {
    
    public convenience init(type: ErrorType, description: Any?) {
        self.init(domain: ProjectErrorDomain, code: type.rawValue, userInfo: type.localizedUserInfo(description: description))
    }
}

