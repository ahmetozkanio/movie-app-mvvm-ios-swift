//
//  ViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLoadingImageView: UIImageView!
    
    @IBOutlet weak var movieSearchField: UITextField!
    @IBOutlet weak var movieTableView: UITableView!
    
    
    lazy var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.didViewLoad()
        
        
        setupUI()
        movieTableViewInitial()
       
    }
    
    @IBAction func searchButtonClick(_ sender: Any) {
        searchLoadingInput()
    }
    

}
extension HomeViewController: HomeViewModelProtocol{
    func isMovieSearchLoading() {
        self.statusView.isHidden = false
        self.statusLoadingImageView.image = UIImage(named:"search")
        
    }
    
    
    func isMovieNoData() {
        self.statusView.isHidden = false
        self.statusLoadingImageView.image = UIImage(named:"no-data")
    }
    
    func movieItemsReload() {
        DispatchQueue.main.async {
          self.movieTableView.reloadData()
          self.statusView.isHidden = true
        }
    }
}
extension HomeViewController{
    func setupUI(){
     
    }
}
extension HomeViewController{
    func searchLoadingInput(){
        homeViewModel.fetchMoviesServiceSearchAndInit(movieSearchField.text)
    }
}

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


private extension HomeViewController{
    private func movieTableViewInitial(){
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableViewRegister()
    }
    private func movieTableViewRegister(){
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.getListItemCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        goToDetailViewController( homeViewModel.didClickItem(at: indexPath.row))
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        if let cellData = homeViewModel.getSearchListCellData(indexPath: indexPath){
            cell.configureCellData(cellData)
            return cell
        }
        return cell
    }
    
 
    
}
