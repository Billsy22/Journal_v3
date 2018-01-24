//
//  EntryController.swift
//  Journal_v3
//
//  Created by Taylor Bills on 1/24/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK:    Properties
    
    var entries: [Entry] = []
    var shared = EntryController()
    
    // MARK:    CRUD Functions
    
    // Add new entry
    func addEntryWith(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
    }
    
    // Remove an entry
    func remove(entry: Entry) {
        let entryToRemove = entries.index(of: entry)
        entries.remove(at: entryToRemove)
    }
    
    // Update an existing entry
    func updateExistingEntry(entry: Entry, newTitle: String, newBody: String) {
        entry.title = newTitle
        entry.body = newBody
    }
}
