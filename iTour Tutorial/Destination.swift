//
//  Destination.swift
//  iTour Tutorial
//
//  Created by Tihara Egodage on 2025-12-03.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    //by default swiftdata wont delete the sights if its dest is deleted. It can be deleted along w the dest by adding .cascade
    @Relationship(deleteRule: .cascade) var sights = [Sight]()
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
