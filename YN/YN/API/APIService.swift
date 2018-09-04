//
//  APIService.swift
//  YN
//
//  Created by Viktor Pechersky on 03.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit


class APIService {
    
    static let sharedInstance = APIService()
    
    private var manager: SessionManager
    
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpShouldSetCookies = false
        manager = SessionManager(configuration: configuration)
    }
    
    
    @discardableResult
    func getTrackList(index: Int) -> Promise<[String: Any]?> {
        return manager.apiRequest(endpoint: .getTrackList(index: index), parameters: nil).apiResponse()
            .then { [weak self] json in
                if let data = json as? [String: Any] {
                    return Promise(value: data)
                }
                return Promise(value: nil)
            }
            .catch { error in
                print("error: \(error)")
        }
    }
    
    func requestInfo(name: String, organization: String, email: String, phone: String) -> Promise<[String: Any]?> {
        return manager.apiRequest(endpoint: .requestinfo, parameters: nil, accessToken: nil).apiResponse()
            .then { [weak self] json in
                if let data = json as? [String: Any] {
                    return Promise(value: data)
                }
                return Promise(value: nil)
            }
            .catch { error in
                print("error: \(error)")
        }
    }
        
}
    
    

