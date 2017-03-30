//
//  GamesViewController.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, GameViewModelDelegate, UICollectionViewDelegate {
    
    // MARK: - Properties
    // MARK: -- Internal
    
    var gameViewModels = [GameViewModel]() {
        didSet {
            //self.gamesCollectionView.reloadData()
        }
    }
    
    var gameViewModel: GameViewModel! {
        didSet {
            gameViewModel.delegate = self
        }
    }

    @IBOutlet weak var gamesCollectionView: UICollectionView!
    
//    let numberOfColumns: CGFloat = 3
//    var cellWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        
//        if let flowLayout = gamesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: 50, height: 50)
//            flowLayout.sectionInset = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
//        }
        
        // Register Nibs
        gamesCollectionView.register(GameCell.self)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        IGDB().getGames(fromService: GameService()) { result in
            self.gameViewModels = result
            
            // Handle UI changes on Main Thread
            DispatchQueue.main.async {
                self.gamesCollectionView.reloadData()
            }

        }
    }
    
//    override func viewDidLayoutSubviews()
//    {
//        if let flowLayout = gamesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (numberOfColumns - 1)
//            let totalCellAvailableWidth = gamesCollectionView.frame.size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right - spaceBetweenCells
//            cellWidth = floor(totalCellAvailableWidth / numberOfColumns);
//        }
//    }
//    
//    override func viewWillLayoutSubviews()
//    {
//        super.viewWillLayoutSubviews()
//        
//        //recalculate the collection view layout when the view layout changes
//        gamesCollectionView.collectionViewLayout.invalidateLayout()
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
