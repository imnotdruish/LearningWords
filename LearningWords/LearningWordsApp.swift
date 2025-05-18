//
//  LearningWordsApp.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI

@main
struct LearningWordsApp: App {
    @State var score: Int = 0
    
    var body: some Scene {
        WindowGroup {
            ContentView(score: $score)
        }
        .modelContainer(for: Unit.self)
    }
}
