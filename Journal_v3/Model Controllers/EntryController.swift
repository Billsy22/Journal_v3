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
    
    // MARK:    Initialization
    
    init() {
        self.entries = loadFromPersistentStorage()
    }
    
    // MARK:    CRUD Functions
    
    // Add new entry
    func addEntryWith(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
        saveToPersistence()
    }
    
    // Remove an entry
    func remove(entry: Entry) {
        guard let entryToRemove = entries.index(of: entry) else { return }
        entries.remove(at: entryToRemove)
        saveToPersistence()
    }
    
    // Update an existing entry
    func updateExistingEntry(entry: Entry, newTitle: String, newBody: String) {
        entry.title = newTitle
        entry.body = newBody
        saveToPersistence()
    }
    
    // Find a save location
    func fileURL() -> URL {
        // find your array of paths
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // assign our documents to a spot in the path
        let documentDirectory = paths[0]
        // name the file
        let fileName = "entries.json"
        // make the url by finding our assigned spot and appending our filename to it
        let url = documentDirectory.appendingPathComponent(fileName)
        // return our newly created url
        return url
    }

    // Save Files
    func saveToPersistence() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving file to disk: \(error), \(error.localizedDescription)")
        }
    }
    
    // Load Files
    func loadFromPersistentStorage() -> [Entry] {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try jsonDecoder.decode([Entry].self, from: data)
            return entries
        } catch let error {
            print("Error loading from disk: \(error), \(error.localizedDescription)")
            return []
        }
    }
}
