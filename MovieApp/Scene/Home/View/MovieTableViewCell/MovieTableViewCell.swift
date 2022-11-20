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
    @IBOutlet weak var yearText: UILabel!
    @IBOutlet weak var releasedText: UILabel!
    @IBOutlet weak var imdbRatingText: UILabel!
    
    @IBOutlet weak var awardsText: UILabel!
    @IBOutlet weak var genreText: UILabel!
    @IBOutlet weak var languageText: UILabel!
    @IBOutlet weak var runtimeText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
}

extension MovieTableViewCell{
    func configureCellData(_ item: MovieTableViewCellEntity ){
        
       
        titleText.text = item.title ?? ""
        yearText.text = item.year ?? ""
        releasedText.text = item.released ?? ""
        imdbRatingText.text = item.imdbRating ?? ""
     
        awardsText.text = item.awards  ?? ""
        genreText.text = item.genre ?? ""
        languageText.text = item.language ?? ""
        directorText.text = item.director ?? ""
        runtimeText.text =  item.runtime ?? ""
        
        if let poster = item.poster{
            posterView.kf.setImage(with:  URL(string: poster))
        }else{
            posterView.image = UIImage(named: "image_sample")
        }
        
      
    }
}
