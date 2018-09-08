//
//  APIService.swift
//  YN
//
//  Created by Viktor Pechersky on 04.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    static let sharedInstance = APIService()
    
    private let appID = "AIzaSyCbVfMWTxgGIJBa6uncFakrHpeKReNmksg"
    private let baseUrl = "https://www.googleapis.com/youtube"

    private init() {}
    
    func getAPI( completion: @escaping (_ result: JSONResponse?) -> Void) {
        let url = baseUrl + "/v3/search?part=snippet&maxResults=25&q=surfing&type=video&key=\(appID)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseData { response in
                
                let decoder = JSONDecoder()
                do {
                    guard let data = response.data else {
                        completion(nil)
                        return
                    }
                    
                    let firsResponse: JSONResponse = try decoder.decode(JSONResponse.self, from: data)
 
                    print("JSON Data: ", firsResponse)
                    completion(firsResponse)
                } catch {
                    completion(nil)
                }
        }
    }
}

