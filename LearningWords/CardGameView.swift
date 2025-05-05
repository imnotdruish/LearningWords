//
//  CardGameView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI

struct CardGameView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    
    @State private var cards = [Card]()
    @State private var selectedUnit = false
    @State private var units = [Unit]()

    let cardExample = [Card](repeating: .example, count: 10)
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray.gradient)
                .ignoresSafeArea()
            
            ZStack {
                ForEach(0..<cards.count, id: \.self) { index in
                    CardView(card: cards[index]) {
                        withAnimation {
                            removeCard(at: index)
                        }
                    }
                    .stacked(at: index, in: cards.count)
                    .allowsHitTesting(index == cards.count - 1)
                    .accessibilityHidden(index < cards.count - 1)
                }
                       
                if differentiateWithoutColor || voiceOverEnabled {
                    AccessibilityView()
                }
            }
        }
    }
}

#Preview {
    CardGameView()
}
