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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        
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
