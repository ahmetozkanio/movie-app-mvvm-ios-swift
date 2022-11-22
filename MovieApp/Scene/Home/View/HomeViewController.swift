//
//  ViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import UIKit
import Lottie

// MARK: HomeViewController

class HomeViewController: UIViewController {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var movieSearchField: UITextField!
    @IBOutlet weak var movieTableView: UITableView!
    
    @IBOutlet weak var movieAnimationView: AnimationView!
    @IBOutlet weak var searchAnimationView: AnimationView!
    @IBOutlet weak var noSearchDataAnimationView: AnimationView!
    
    lazy var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.didViewLoad()
        setupUI()
        movieTableViewInitial()
    }
    
    // MARK: HomeViewController Buttons Action
    
    @IBAction func searchButtonClick(_ sender: Any) {
        searchLoadingInput()
    }
}

// MARK: HomeViewController Search Configure

extension HomeViewController: HomeViewModelProtocol{
    func isMovieSearchLoading() {
        DispatchQueue.main.async {
            self.statusView.isHidden = false
            self.searchAnimationView.isHidden = false
            self.noSearchDataAnimationView.isHidden = true
            self.searchAnimationView.loopMode = .loop
            self.searchAnimationView.play()
        }
        
    }
    
    func isMovieNoData() {
        DispatchQueue.main.async {
            self.statusView.isHidden = false
            self.searchAnimationView.isHidden = true
            self.noSearchDataAnimationView.isHidden = false
            self.noSearchDataAnimationView.loopMode = .loop
            self.noSearchDataAnimationView.play()
        }
    }
    
    func movieItemsReload() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
            self.statusView.isHidden = true
        }
    }
}
// MARK: HomeViewController Search Text Input Call
extension HomeViewController{
    func searchLoadingInput(){
        homeViewModel.fetchMoviesServiceSearchAndInit(movieSearchField.text)
    }
}

// MARK: HomeViewController SetupUI
extension HomeViewController{
    func setupUI(){
        movieAnimationView.loopMode = .loop
        movieAnimationView.play()
    }
}

// MARK: HomeViewController Route

extension HomeViewController{
    func goToDetailViewController(_ item: Movie?){
        OperationQueue.main.addOperation {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller  = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewID") as! MovieDetailViewController
            controller.modalPresentationStyle = .overFullScreen
            controller.modalTransitionStyle = .flipHorizontal
            controller.item = item
            self.present(controller, animated: true, completion: nil)
        }
    }
}

