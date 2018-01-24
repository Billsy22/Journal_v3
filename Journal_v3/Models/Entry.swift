//
//  Entry.swift
//  Journal_v3
//
//  Created by Taylor Bills on 1/24/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    // MARK:    Properties
    
    var title: String
    var body: String
    var timeStamp: Date
    
    // MARK:    Initializer
    
    init(title: String, body: String, timeStamp: Date) {
        self.title = title
        self.body = body
        self.timeStamp = Date()
    }
    
    // MARK:    Equatable
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title &&
        lhs.body == rhs.body &&
        lhs.timeStamp == rhs.timeStamp
    }
}
