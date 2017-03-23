//
//  GameCell.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(_ gameViewModel: GameViewModel) -> Self {
        // Configure Views
        nameLabel.text = gameViewModel.nameText
        
        return self
    }

}
