//
//  DisneyCharacterTableViewController.swift
//  BYOA.4.3
//
//  Created by Briana Bayne on 6/14/23.
//

import UIKit

class DisneyCharacterTableViewController: UITableViewController {
    var character: DisneyCharacter?
    var disneyArray: [DisneyCharacter] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisneyCharacterController.fetchCharacter { [weak self] disney in
            guard let disney = disney else { return }
            
            // UI change - going back to the main thread by calling dispatch
            DispatchQueue.main.async {
                self?.disneyArray =  disney
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { // can delete becasue it will always return one section but I like to leave it.
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return disneyArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "disneyCell", for: indexPath)
        // one disney character per cell
        let disney = disneyArray[indexPath.row]
        cell.textLabel?.text = disney.name
    

        return cell
    }
  

 
     

}
