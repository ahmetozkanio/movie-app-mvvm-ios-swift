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

    // Movie models is fetch
    func fetchMovies(searchText: String, onSuccess: @escaping (Movie?) -> (), onError: @escaping (String?) -> ()) {
        let endPoint = Constant.MovieServiceEndPoint.movieGetEndPoint()
        let apiKey = Constant.MovieServiceEndPoint.movieApiKey()
        let params  = [
            "apikey": apiKey,
            "t": searchText
        ]
        ServiceManager.shared.fetch(path: endPoint, params: params) { (response: Movie) in
            onSuccess(response)
          
        } onError: { error in
            print("Fetch Movies Error: \(String(describing: error))")
        }

        
    }
}

