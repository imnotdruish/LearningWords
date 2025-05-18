//
//  ContentView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Binding var score: Int

    var body: some View {
        TabView {
            Tab("Units", systemImage: "list.bullet") {
                MainView()
            }
            Tab("Cards", systemImage: "square.stack.3d.down.right.fill") {
                CardGameView(score: $score)
            }
            .tabPlacement(.automatic)
        }
        .accentColor(.mint)
    }
}

#Preview {
    ContentView(score: .constant(0))
}

