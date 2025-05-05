//
//  Unit.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import Foundation

class Unit: Codable {
    
    var title: String
    var words: [String]
    var createdAt: Date

    init(title: String, words: [String], createdAt: Date) {
        self.title = title
        self.words = words
        self.createdAt = createdAt
    }
    
    static let example = Unit(title: "Unit One", words: ["bat","cat","fat","hat","mat","pat","rat","sat","chat"], createdAt: Date())
    
}
