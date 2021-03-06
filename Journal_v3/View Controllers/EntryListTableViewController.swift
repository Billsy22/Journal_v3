//
//  EntryListTableViewController.swift
//  Journal_v3
//
//  Created by Taylor Bills on 1/24/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    // MARK:    Properties
    
    @IBOutlet var entryListTableView: UITableView!
    
    // MARK:    Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK:    Table view data source functions

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.remove(entry: entry)
            tableView.reloadData()
        }    
    }

    // MARK:    Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditEntry" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            guard let entryDetailVC = segue.destination as? EntryDetailViewController else { return }
            entryDetailVC.entry = entry
        }
    }
    
    // MARK:    Update Views
    
}
