//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import UIKit
import Kingfisher
class MovieDetailViewController: UIViewController {
    var item: Movie?
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var yearText: UILabel!
    @IBOutlet weak var runtimeText: UILabel!
    @IBOutlet weak var imdbText: UILabel!
    @IBOutlet weak var subtitleText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var directorText: UILabel!
    @IBOutlet weak var genreText: UILabel!
    @IBOutlet weak var awardsText: UILabel!
    @IBOutlet weak var contentText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
// MovieDetailViewInitial configure data
extension MovieDetailViewController{
    func configure(){
        if item != nil {
            posterView.kf.setImage(with:  URL(string: (item?.poster)!))
            
            yearText.text = item?.year ?? ""
            runtimeText.text = item?.runtime ?? ""
            imdbText.text = item?.imdbRating ?? ""
            subtitleText.text = item?.actors ?? ""
            titleText.text = item?.title ?? ""
            directorText.text = item?.director ?? ""
            genreText.text = item?.genre ?? ""
            awardsText.text = item?.awards ?? ""
            contentText.text = item?.plot ?? ""
           }
    }
}
