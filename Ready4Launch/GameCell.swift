//
//  GameCell.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import UIKit
import Kingfisher
import AlamofireImage

class GameCell: UICollectionViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(_ gameViewModel: GameViewModel) -> Self {
        // Configure Views
        nameLabel.text = gameViewModel.nameText
        ratingLabel.text = gameViewModel.rating
        
//        coverImageView.kf.indicatorType = .activity
////        coverImageView.kf.setImage(with: gameViewModel.cover, options: [.transition(.fade(0.2))])
//        print(gameViewModel.cover)
//        coverImageView.kf.setImage(with: gameViewModel.cover)
        
        coverImageView.af_setImage(withURL: gameViewModel.cover)
        coverImageView.clipsToBounds = true
        print(gameViewModel.cover)
        
        return self
    }

}
