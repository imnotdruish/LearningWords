//
//  Word.swift
//  LearningWords
//
//  Created by Dan June on 5/14/25.
//

import SwiftData
import SwiftUI

@Model
class Word {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
