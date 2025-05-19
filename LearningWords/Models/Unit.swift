//
//  Unit.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftData
import SwiftUI

@Model
class Unit {
    
    var title: String
    var createdAt: Date
    @Relationship(deleteRule: .cascade) var words = [Word]()
    
    init(title: String = "", createdAt: Date = .now) {
        self.title = title
        self.createdAt = createdAt
    }
    
    static let example = Unit(title: "Unit One", createdAt: Date())
}


