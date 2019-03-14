//
//  AddTechniqueTableViewCell.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/4/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import UIKit

@objc protocol AddTechniqueCellDelegate: class {
    func checkmarkTapped(sender: AddTechniqueTableViewCell)
}

class AddTechniqueTableViewCell: UITableViewCell {

    var delegate: AddTechniqueCellDelegate?
    
    @IBOutlet weak var addTechniqueLabel: UILabel!
    
}
