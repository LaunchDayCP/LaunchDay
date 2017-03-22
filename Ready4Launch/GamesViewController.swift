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
        
        // Register Nibs
        gamesCollectionView.register(GameCell.self)

        // Do any additional setup after loading the view.
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
