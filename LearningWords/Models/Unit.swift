//
//  Unit.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import Foundation
//import SwiftUI
//import SwiftData

//@Model
//class Unit {
//    
//    var title: String
//    var createdAt: Date
//    @Relationship(deleteRule: .cascade) var words = [Word]()
//    
//    init(title: String = "", createdAt: Date = .now) {
//        self.title = title
//        self.createdAt = createdAt
//    }
//    
//    static let example = Unit(title: "Unit One", createdAt: Date())
//}

struct Unit: Codable {
    let title: String
    let created: Date
    let words: [String]
    
    enum CodingKeys: String, CodingKey {
        case title
        case created
        case words
    }
    
    static let example = Unit(title: "Unit One", created: Date(), words: ["apple", "banana", "cherry"])
}
