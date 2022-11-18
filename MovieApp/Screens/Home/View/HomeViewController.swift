//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 18.11.2022.
//

import UIKit

class HomeViewController: UIViewController {

        let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
}
extension HomeViewController{
    func setupUI(){
        title = "Search"
    }
}
