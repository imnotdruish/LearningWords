//
//  User.swift
//  LearningWords
//
//  Created by Dan June on 7/5/25.
//

import Foundation

struct User: Codable {
    
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var useCase: String
    var ageRange: String
    var units: [Unit]
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case email
        case password
        case useCase
        case ageRange
        case units
    }
}
