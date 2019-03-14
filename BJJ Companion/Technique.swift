//
//  Techniques.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/3/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import Foundation

struct Technique {
    var name: String
    var isSelected: Bool
    var performed: Bool
    
    static func loadSampleTechniques() -> [Technique] {
        let tech1 = Technique(name: "Armbar", isSelected: false, performed: false)
        
        let tech2 = Technique(name: "Takedown", isSelected: false, performed: false)
        
        let tech3 = Technique(name: "Choke", isSelected: false, performed: false)
        
        let tech4 = Technique(name: "Pass", isSelected: false, performed: false)
        
        let tech5 = Technique(name: "Throw", isSelected: false, performed: false)
        
        let tech6 = Technique(name: "Triangle", isSelected: false, performed: false)
        
        return [tech1, tech2, tech3, tech4, tech5, tech6]
    }
}
