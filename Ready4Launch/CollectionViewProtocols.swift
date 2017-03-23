//
//  CollectionViewProtocols.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import Foundation
import UIKit

// MARK: UICollectionViewProtocols

protocol ReusableView: class {}
protocol NibLoadableView: class { }

/*
 MARK: - Identifier Helper & Nib Name Helper
 Turning a class name into a String for use as an identifier/nib name
 return - GridCell.reuseIdentifier == "GridCell"
 */

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView { }
extension UICollectionViewCell: NibLoadableView { }
