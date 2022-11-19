//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 19.11.2022.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var directorText: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
}

extension MovieTableViewCell{
    func configureCellData(_ item: MovieTableViewCellEntity ){
        titleText.text = item.title
        directorText.text = item.director
        posterView.kf.setImage(with:  URL(string: item.poster!))
    }
}
