//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import Foundation
protocol HomeViewModelProtocol: AnyObject{
    func movieItemsReload()
}
protocol MovieListItemsDelegate: AnyObject{
    func getMovieItems(_ items: Movie?)
}
final class HomeViewModel{
    weak var delegate: HomeViewModelProtocol?
    private let moviesService: HomeModelProtocol = HomeModel()
    weak var movieListItemsDelegate: MovieListItemsDelegate?
    private var movieItem: Movie?
    init(){}
    func didViewLoad(){
        fetchMoviesServiceSearchAndInit(nil)
    }
}
extension HomeViewModel{
    func fetchMoviesServiceSearchAndInit(_ searchText: String?){
        self.moviesService.fetchMovies(searchText:  (searchText != nil) ? searchText! : "joker" ) { [weak self] (model) in
            self?.movieItem = model
            self?.delegate?.movieItemsReload()
            //movieItems = model
          // print(movieItems)
          // self?.movieListItemsDelegate?.getMovieItems(model)
        } onError: {  error in
            print(error ?? "Error moviesService HomeViewModel")
        }
    }
  
}
//MARK: Movie Table List Process
extension HomeViewModel {

    func getListItemCount() -> Int{
            return 1
    }
    func didClickItem(at item: Int) -> Movie? {
            return movieItem
    }
        func getSearchListCellData(indexPath: IndexPath ) -> MovieTableViewCellEntity? {
            if let item = movieItem{
              return  MovieTableViewCellEntity(title: item.title, year: item.year, released: item.released, imdbRating: item.imdbRating, imdbVotes: item.imdbVotes, runtime: item.runtime, director: item.director, awards: item.awards, poster: item.poster)
            }
            return nil
        }
    }


