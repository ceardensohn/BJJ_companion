//
//  SequenceCell.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/7/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import UIKit

@objc protocol SequenceCellDelegate: class {
    func checkmarkTapped(sender: SequenceCell)
}

class SequenceCell: UITableViewCell {
    
    @IBOutlet weak var sequenceLabel: UILabel!
    
    var delegate: SequenceCellDelegate?
    
}
