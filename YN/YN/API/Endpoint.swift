//
//  Endpoint.swift
//  YN
//
//  Created by Viktor Pechersky on 03.09.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import Alamofire


var flag = true
var currentIndex: Int = 6

enum Endpoint {
    case getTrackList(index: Int)
    case requestinfo
    
    // MARK: - Public Properties
    var method: HTTPMethod {
        switch self {
        case .getTrackList,
             .requestinfo:
            return .get
        }
    }
    
    
    //TODO: NSURL.getBaseUrl() depends on dev/prod
    var url: String {
        
        let baseUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&q=surfing&type=video&key=AIzaSyCbVfMWTxgGIJBa6uncFakrHpeKReNmksg"
        //let baseUrl = "https://api.deezer.com"
        
        switch self {
        case .getTrackList(let index):
            return baseUrl + "/artist/\(index)/top?limit=50"
        case .requestinfo:
            return baseUrl + "/leads"
        }
    }
}
