//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject{
    func movieItemsReload()
    func isMovieNoData()
    func isMovieSearchLoading()
}

protocol MovieListItemsDelegate: AnyObject{
    func getMovieItems(_ items: Movie?)
}
final class HomeViewModel{
    weak var delegate: HomeViewModelProtocol?

    private let moviesService: HomeModelProtocol = HomeModel()
    weak var movieListItemsDelegate: MovieListItemsDelegate?
    private var movieItem: Movie?
    private var itemCount = 0
    
    init(){}
    
    func didViewLoad(){
        fetchMoviesServiceSearchAndInit(nil)
    }
}
extension HomeViewModel{
    func fetchMoviesServiceSearchAndInit(_ searchText: String?){
        self.delegate?.isMovieSearchLoading()
        
        
        self.moviesService.fetchMovies(searchText:  (searchText != nil) ? searchText! : "joker" ) { [weak self] (model) in
          
            if (model?.response?.lowercased() == "true") {
                self?.movieItem = model
                self?.delegate?.movieItemsReload()
                self?.itemCount = 1
            }else{
                self?.delegate?.isMovieNoData()
                self?.itemCount = 0
            }
            
        } onError: {  error in
            print(error ?? "Error moviesService HomeViewModel")
        }
    }
  
}
//MARK: Movie Table List Process
extension HomeViewModel {

    func getListItemCount() -> Int{
            return itemCount
    }
    func didClickItem(at item: Int) -> Movie? {
            return movieItem
    }
        func getSearchListCellData(indexPath: IndexPath ) -> MovieTableViewCellEntity? {
            if let item = movieItem{
                return  MovieTableViewCellEntity(title: item.title, year: item.year, released: item.released, imdbRating: item.imdbRating, imdbVotes: item.imdbVotes, runtime: item.runtime, director: item.director, awards: item.awards,genre: item.genre,language: item.language, poster: item.poster)
            }
            return nil
        }
    }


