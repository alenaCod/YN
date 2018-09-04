//
//  Manager.swift
//  YN
//
//  Created by Viktor Pechersky on 03.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import Alamofire

extension SessionManager {
    
    private func getHeader(accessToken: String! = nil) -> [String: String] {
        var header: [String: String] = [:]
        
        header = ["Accept": "application/json"]
        header["x-mashape-key"] = "pjA81zY4QQmshef46JVPPON78KRNp1UjWhTjsn0JJz3yacI24f" // x-mashape-key
        // }
        return header
    }
    
    func apiRequest(endpoint: Endpoint, parameters: [String : Any]? = nil, accessToken: String! = nil) -> DataRequest {
        let headers = getHeader(accessToken: accessToken)
        //print("endpoint.url: ", endpoint.url)
        return request(endpoint.url, method: endpoint.method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
    }
}
