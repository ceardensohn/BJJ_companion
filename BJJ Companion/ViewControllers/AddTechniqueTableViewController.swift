//
//  AddTechniqueTableViewController.swift
//  BJJ Companion
//
//  Created by ceardensohn on 5/4/18.
//  Copyright © 2018 Christopher Eardensohn. All rights reserved.
//

import UIKit

class AddTechniqueTableViewController: UITableViewController, AddTechniqueCellDelegate {

    var techniques = [Technique]()
    var technique: Technique?
    
    func checkmarkTapped(sender: AddTechniqueTableViewCell) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        techniques = Technique.loadSampleTechniques()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return techniques.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddTechniqueCellIdentifier") as? AddTechniqueTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        
        let technique = techniques[indexPath.row]
        cell.addTechniqueLabel?.text = technique.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        techniques[indexPath.row].isSelected = true
        
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let selectedIndex = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectedIndex, animated: false)
            
            self.tableView.cellForRow(at: selectedIndex)?.accessoryType = .none
            techniques[selectedIndex.row].isSelected = false
        }
        return indexPath
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {return}
        
        for tech in techniques {
            if tech.isSelected == true {
                let name = tech.name
                let isSelected = tech.isSelected
                let performed = tech.performed
                technique = Technique(name: name, isSelected: isSelected, performed: performed)
            }
        }
    }
}
