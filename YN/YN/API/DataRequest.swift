//
//  DataRequest.swift
//  YN
//
//  Created by Viktor Pechersky on 03.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

extension DataRequest {
    func apiResponse(completion: @escaping(ApiResult<Any?>) -> Void) {
        
        self.responseJSON { response in
            switch (response.result) {
            case .success:
                var statusCode = 0
                if let value = response.response?.statusCode {
                    statusCode = value
                }
                
                switch statusCode {
                case ErrorType.success.rawValue:
                    completion(ApiResult{ return response.result.value })
                default:
                    
                    print("fail: \(response.result)")
                    completion(ApiResult{ throw Utils.cutomError(code: statusCode, message: "Some error occurs") })
                }
                
            case .failure(let error):
                completion(ApiResult{ throw error })
            }
        }
    }
}

extension Alamofire.DataRequest {
    
    public func apiResponse() -> Promise<Any?> {
        return Promise { fulfill, reject in
            response(queue: nil) { rsp in
                if let error = rsp.error {
                    reject(error)
                } else if let response = rsp.response, let data = rsp.data {
                    
                    switch response.statusCode {
                    case ErrorType.success.rawValue:
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
                        print("JSON data response: ", json)
                        fulfill(json)
                    default:
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
                        let errType = ErrorType(rawValue: response.statusCode) ?? .unknown
                        
                        let error = NSError(type: errType, description: json)
                        print("JSON error data response: ", response)
                        reject(error)
                    }
                    
                } else {
                    reject(PMKError.invalidCallingConvention)
                }
            }
        }
    }
    
    public func apiResponseData() -> Promise<Any?> {
        return Promise { fulfill, reject in
            response(queue: nil) { rsp in
                if let error = rsp.error {
                    reject(error)
                } else if let response = rsp.response, let data = rsp.data {
                    
                    switch response.statusCode {
                    case ErrorType.success.rawValue:
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
                        fulfill(data)
                    default:
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
                        print("JSON error data response: ", response)
                        let errType = ErrorType(rawValue: response.statusCode) ?? .unknown
                        
                        let error = NSError(type: errType, description: json)
                        reject(error)
                    }
                    
                } else {
                    reject(PMKError.invalidCallingConvention)
                }
            }
        }
    }
}
