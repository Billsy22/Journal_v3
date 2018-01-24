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
    
    static var shared = EntryController()
    var entries: [Entry] = []
    
    // MARK:    CRUD Functions
    
    // Add new entry
    func addEntryWith(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
    }
    
    // Remove an entry
    func remove(entry: Entry) {
        guard let entryToRemove = entries.index(of: entry) else { return }
        entries.remove(at: entryToRemove)
    }
    
    // Update an existing entry
    func updateExistingEntry(entry: Entry, newTitle: String, newBody: String) {
        entry.title = newTitle
        entry.body = newBody
    }
}
