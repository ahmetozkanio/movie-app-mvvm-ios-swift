//
//  MovieTableView.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 22.11.2022.
//

import UIKit

// MARK: HomeViewController Movie TableView Configure

extension HomeViewController{
    func movieTableViewInitial(){
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
