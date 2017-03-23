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
    var releaseDates: [NSDictionary]
    var name: String
    var rating: Double
    var cover: NSDictionary
    var genres: [NSDictionary]
    var screenshots: [NSDictionary]
    var videos: [NSDictionary]
    
    init?(game: NSDictionary) {
        releaseDates = game["release_dates"] as! [NSDictionary]
        name = game["name"] as! String
        rating = game["aggregated_rating"] as! Double
        cover = game["cover"] as! NSDictionary
        genres = game["genres"] as! [NSDictionary]
        screenshots = game["screenshots"] as! [NSDictionary]
        videos = game["videos"] as! [NSDictionary]
    }
}
