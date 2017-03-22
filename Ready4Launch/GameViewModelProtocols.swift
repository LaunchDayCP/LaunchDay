//
//  GameViewModelProtocols.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import Foundation
import UIKit

// read only properties to allow a one way flow of data
protocol GameViewModelProtocol {
    
    // declared weak in order to avoid reference cycle
    weak var delegate: GameViewModelDelegate? { get set }
    
    var game: Game { get }
    var categoriesText: String { get }
    var nameText: String { get }
    var rating: String { get }
    var cover: UIImage { get }
    var genre: String { get }
}

// Delegate used to updated views: The controller should be set as the delegate
protocol GameViewModelDelegate: class {
    // Update the View Controllers views
    
    // func reloadViews
    
    
}

// Abstract presentation from data, can now configure in an extension of GameViewModel
// Allows to easily find and change UI using only one line
protocol GameViewModelPresentable {
    
    var font: UIFont { get }
    var textColor: UIColor { get }
    var textShadow: NSShadow { get }
    
}
