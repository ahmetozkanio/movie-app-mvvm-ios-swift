//
//  ViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var movieSearchField: UITextField!
    @IBOutlet weak var movieTableView: UITableView!
    
    
    lazy var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.didViewLoad()
        
        
        setupUI()
        movieTableViewInitial()
        movieSearchFieldInitial()
    }
    
    @objc func reloadMovies(){
        //articleItemsReload()
       // articleIndicatorLoading.isHidden = false
    }
}
extension HomeViewController: HomeViewModelProtocol{
    func movieItemsReload() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
          //  self.articleIndicatorLoading.isHidden = true
        }
    }
}
extension HomeViewController{
    func setupUI(){
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
extension HomeViewController: UITextFieldDelegate{
    
    func movieSearchFieldInitial(){
        movieSearchField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var searchText  = textField.text!
        print(searchText)
        // limit to 3 characters
        let characterCountLimit = 3
        
        let startingLength = searchText.count // Length of text
        let lengthToAdd = string.count // Length of text add
        let lengthToReplace = range.length // add/delete o text  add = 0, backspace = 1
        let newLength = startingLength + lengthToAdd - lengthToReplace // Total length
        
        // Backspace Controller
        if range.length == 0{
            searchText += string
        }else if range.length == 1{
            searchText.removeLast()
        }
        // 3 second wait after searching process
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        // Limit controller
        if characterCountLimit <= newLength{
           
                self.homeViewModel.fetchMoviesServiceSearchAndInit(searchText)
                self.movieItemsReload()
            }
            else{
               // if !searchViewModel.searchListItems.isEmpty {
               //     searchViewModel.searchListItems.removeAll()
              //  }
            }
        }
       // self.searchListItemsReload()
        return true
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
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
