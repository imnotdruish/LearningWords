//
//  ContentView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var selection = TabType.units
    @Binding var score: Int
    
    var body: some View {
        TabView(selection: $selection) {
            MainView()
                .tag(TabType.units)
                .toolbarVisibility(.hidden, for: .tabBar)
            CardGameView(score: $score)
                .tag(TabType.cards)
                .toolbarVisibility(.hidden, for: .tabBar)
        }
        .safeAreaInset(edge: .bottom) {
            CustomTabBar(selection: $selection)
        }
    }
}

#Preview {
    ContentView(score: .constant(0))
}
