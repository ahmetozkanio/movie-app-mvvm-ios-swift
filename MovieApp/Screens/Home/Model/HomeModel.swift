//
//  HomeModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 18.11.2022.
//

import Foundation

// MARK: HomeModelProtocol
protocol HomeModelProtocol: AnyObject{
    func fetchMovies(onSuccess: @escaping (Movie?) -> (), onError: @escaping (String?) -> ())
}
// MARK: HomeModel
final class HomeModel: HomeModelProtocol{
  
    
    
    // Movie models is fetch
    func fetchMovies(onSuccess: @escaping (Movie?) -> (), onError: @escaping (String?) -> ()) {
        ServiceManager.shared.fetch(path: Constant.ArticleServiceEndPoint.articleGetEndPoint()) { (response: Movie) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}

