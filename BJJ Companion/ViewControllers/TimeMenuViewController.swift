//
//  TimeMenuViewController.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/3/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import UIKit

class TimeMenuViewController: UIViewController {

    
    
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    
    @IBOutlet weak var minuteStepper: UIStepper!
    
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        displayTimeLabel.text = "\(Int(minuteStepper.value)) minutes"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func stepperPressed(_ sender: UIStepper) {
        displayTimeLabel.text = "\(Int(minuteStepper.value)) minutes"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
