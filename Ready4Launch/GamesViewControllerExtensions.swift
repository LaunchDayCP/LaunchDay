//
//  GamesViewControllerExtensions.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import Foundation
import UIKit

// MARK: - GamesViewController CollectionView Extensions

let sectionInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
let itemsPerRow: CGFloat = 3


extension GamesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Already initialized, worse case is 0
        return gameViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as GameCell
        gameViewModel = gameViewModels[indexPath.row]
        
        print(gameViewModel.nameText)
        
        return cell.bind(gameViewModel)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
//        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as GameCell
//        let autoLayoutCell = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
//        
//        print(autoLayoutCell.height)
        
        return CGSize(width: widthPerItem, height: widthPerItem * 2)
        
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as? GameCell {
//            let cellMargins = cell.layoutMargins.left + cell.layoutMargins.right
//            cell.nameLabel.preferredMaxLayoutWidth = 50
//            //cell.labelWidthLayoutConstraint.constant = cellWidth - cellMargins //adjust the width to be correct for the number of columns
//            return cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize) //apply auto layout and retrieve the size of the cell
//        }
//        return CGSize(width: 0, height: 0)
        
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
