//
//  ServiceConstant.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 18.11.2022.
//

import Foundation

extension Constant{
    
    enum MovieServiceEndPoint: String{
        case BASE_URL = ""
        case API_KEY = ""
        
        static func movieGetEndPoint() -> String{
            "\(BASE_URL.rawValue)\(API_KEY.rawValue)"
        }
    }
   
}
