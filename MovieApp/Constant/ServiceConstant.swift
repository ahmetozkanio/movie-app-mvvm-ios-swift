//
//  ServiceConstant.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
// 


import Foundation

extension Constant{
    
    enum MovieServiceEndPoint: String{
        case BASE_URL = "https://www.omdbapi.com"
        case API_KEY = "73857ef3"
        
        
        static func movieGetEndPoint() -> String{
            "\(BASE_URL.rawValue)"
        }
        static func movieApiKey() -> String{
            "\(API_KEY.rawValue)"
        }
    }
   
}
