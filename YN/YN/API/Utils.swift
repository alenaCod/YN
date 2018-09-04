//
//  Utils.swift
//  YN
//
//  Created by Viktor Pechersky on 03.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation

final class Utils {
    
    class func cutomError(code: Int, message: String) -> NSError {
        return NSError(domain: "com.trakkers", code: code, userInfo: [NSLocalizedDescriptionKey : message])
    }
    
    class func buildFullPath(currentLocationTree: [String]) -> String {
        var fullTree = ""
        guard currentLocationTree.count > 0 else {
            return "We’re not covering this location at the moment"
        }
        let count = currentLocationTree.count - 1
        for i in 0...count {
            fullTree += currentLocationTree[i]
            if i < count {
                fullTree += " > "
            }
        }
        return fullTree == "" ? "We’re not covering this location at the moment" : fullTree
    }
}
