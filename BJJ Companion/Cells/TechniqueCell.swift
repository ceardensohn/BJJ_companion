//
//  TechniqueTableViewCell.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/3/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import UIKit

@objc protocol TechniqueCellDelegate: class {
    func checkmarkTapped(sender: TechniqueCell)
}

class TechniqueCell: UITableViewCell {

    var delegate: TechniqueCellDelegate?
    
    @IBOutlet weak var techniqueLabel: UILabel!
    
}
