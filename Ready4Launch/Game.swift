//
//  Game.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import Foundation

// MARK: - Game Model

class Game {
    var categories: String
    var name: String
    var rating: String
    var cover: String
    var genre: String
    
    init?(game: NSDictionary) {
        categories = game["test"] as! String
        name = game["test"] as! String
        rating = game["test"] as! String
        cover = game["test"] as! String
        genre = game["test"] as! String
    }
}
