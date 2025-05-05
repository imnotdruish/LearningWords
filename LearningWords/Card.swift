//
//  Card.swift
//  LearningWords
//
//  Created by Dan June on 5/3/25.
//

import SwiftUI
import SwiftData

@Model
class Card {
    var word: String
    
    init(word: String) {
        self.word = word
    }
    
    static let example = Card(word: "bat")
}
