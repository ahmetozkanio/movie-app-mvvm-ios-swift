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
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var labelSub: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var labelBottom1: UILabel!
    @IBOutlet weak var labelBottom2: UILabel!
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
            
            label1.text = item?.awards
            label2.text = item?.awards
            label3.text = item?.awards
            labelSub.text = item?.awards
            labelTitle.text = item?.title
            labelContent.text = item?.awards
            labelBottom1.text = item?.awards
            labelBottom2.text = item?.awards
           }
    }
}
