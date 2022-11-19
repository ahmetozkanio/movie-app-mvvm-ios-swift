//
//  HomeModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import Foundation
import Alamofire




// MARK: HomeModelProtocol
protocol HomeModelProtocol: AnyObject{
    func fetchMovies(searchText: String,onSuccess: @escaping (Movie?) -> (), onError: @escaping (String?) -> ())
}
// MARK: HomeModel
class HomeModel: HomeModelProtocol{

    var endPoint = "https://www.omdbapi.com"
    // Movie models is fetch
    func fetchMovies(searchText: String, onSuccess: @escaping (Movie?) -> (), onError: @escaping (String?) -> ()) {
        let params  = [
            "apikey": "73857ef3",
            "t": searchText
        ]
        print(searchText)
        AF.request( endPoint,parameters: params ).validate().responseDecodable(of: Movie.self) { response in
            guard let model = response.value else{print(response.error as Any); return}
            onSuccess(model)
            print(model)
        }
    }
}

