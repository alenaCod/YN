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
    
    //private let appID = "AIzaSyCbVfMWTxgGIJBa6uncFakrHpeKReNmksg"


    private init() {}
    
    func getAPI( comletion: @escaping (_ result: JSONResponse?) -> Void) {
        let url = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&q=surfing&type=video&key=AIzaSyCbVfMWTxgGIJBa6uncFakrHpeKReNmksg"
        //let url = "https://api.openweathermap.org/data/2.5/forecast?id=\(idCity.toString())&APPID=\(appID)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseData { response in
                
                let decoder = JSONDecoder()
                do {
                    guard let data = response.data else {
                        comletion(nil)
                        return
                    }
                    //let weather: JSONResponse = try decoder.decode(JSONResponse.self, from: data)
                    let firsResponse: JSONResponse = try decoder.decode(JSONResponse.self, from: data)
                    comletion(firsResponse)
                    print("  ||  Start ->   "  , firsResponse)
                } catch {
                    comletion(nil)
                }
        }
    }
}

