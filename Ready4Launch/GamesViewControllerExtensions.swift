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

extension GamesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Already initialized, worse case is 0
        
        return gameViewModels.count + 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as GameCell
        gameViewModel = gameViewModels[indexPath.row]
        
        return cell.bind(gameViewModel)
    }
}
