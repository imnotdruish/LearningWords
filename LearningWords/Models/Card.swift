//
//  Card.swift
//  LearningWords
//
//  Created by Dan June on 5/3/25.
//

import Foundation

struct Card: Codable {
    var word: String
    
    static let example = Card(word: "bat")
}
