//
//  GameViewModel.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Configure data for GameViewModel

class GameViewModel: GameViewModelProtocol {
    
    weak internal var delegate: GameViewModelDelegate?
    
    internal var game: Game
    
    var catagoriesText: String {
        return "The catagories are \(game.categories)"
    }
    
    var nameText: String {
        return "The name is \(game.name)"
    }
    
    var rating: String {
        return "This game is rated \(game.rating)"
    }
    
    var cover: UIImage {
        let image = UIImage(named: "dummy image")// Set Image with pod or using http://stackoverflow.com/questions/39813497/swift-3-display-image-from-url UIImage(data: game.cover)
        return image!
    }
    
    var genre: String {
        return game.genre
    }
    
    init(game: Game) {
        self.game = game
    }
    
    internal var categoriesText: String = ""
    
    
}

// MARK: - Configure presentation for GameViewModel data
extension GameViewModel: GameViewModelPresentable {
    
    var textColor: UIColor {
        return UIColor.black
    }
    
    var font: UIFont {
        return UIFont.boldSystemFont(ofSize: 12)
    }
    
    var textShadow: NSShadow {
        return NSShadow()
    }
}
