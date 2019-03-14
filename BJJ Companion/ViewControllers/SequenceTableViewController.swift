//
//  SequenceTableViewController.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/4/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import UIKit

class SequenceTableViewController: UITableViewController, SequenceCellDelegate {
    
    
    func checkmarkTapped(sender: SequenceCell) {
    }
    
    var techniques = [Technique]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return techniques.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SequenceCellIdentifier") as? SequenceCell else {
            fatalError("Could not dequeue a cell")
        }
        
        cell.delegate = self
        
        let technique = techniques[indexPath.row]
        cell.sequenceLabel?.text = technique.name
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    // MARK: - Navigation

    @IBAction func unwindAddTechnique(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddTechniqueTableViewController
        
        if let technique = sourceViewController.technique {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                techniques[selectedIndexPath.row] = technique
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: techniques.count, section: 0)
                techniques.append(technique)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}
