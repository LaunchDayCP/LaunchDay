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
    
    internal var releaseDates: [NSDictionary] {
        return game.releaseDates
    }
    
    var nameText: String {
        return game.name
    }
    
    var rating: String {
        return String(describing: game.rating)
    }
    
    var cover: NSDictionary {
        //let image = UIImage(named: "dummy image")// Set Image with pod or using http://stackoverflow.com/questions/39813497/swift-3-display-image-from-url UIImage(data: game.cover)
        return game.cover
    }
    
    var genres: [NSDictionary] {
        return game.genres
    }
    
    var screenshots: [NSDictionary] {
        return game.screenshots
    }
    
    var videos: [NSDictionary] {
        return game.videos
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
