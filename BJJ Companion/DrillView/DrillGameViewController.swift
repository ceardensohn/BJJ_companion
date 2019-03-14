//
//  DrillGameViewController.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/9/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import UIKit
import SpriteKit

class DrillGameViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        let scene = DrillScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
}
