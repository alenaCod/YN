//
//  ApiResult.swift
//  YN
//
//  Created by Viktor Pechersky on 03.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation

enum ApiResult<Value> {
    case success(value: Value)
    case failure(error: NSError)
    
    init(_ f: () throws -> Value) {
        do {
            let value = try f()
            self = .success(value: value)
        } catch let error as NSError {
            self = .failure(error: error)
        }
    }
    
    func unwrap() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}
