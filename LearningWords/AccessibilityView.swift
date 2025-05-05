//
//  AccessibilityView.swift
//  LearningWords
//
//  Created by Dan June on 5/5/25.
//

import SwiftUI

struct AccessibilityView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    
    @State private var cards = [Card]()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    withAnimation {
                        removeCard(at: cards.count - 1)
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .padding()
                        .background(.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .accessibilityLabel("Wrong")
                .accessibilityHint("Mark your anwser as being incorrect")
                
                Spacer()
                Button {
                    withAnimation {
                        removeCard(at: cards.count - 1)
                    }
                } label: {
                    Image(systemName: "checkmark.circle")
                        .padding()
                        .background(.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .accessibilityLabel("Correct")
                .accessibilityHint("Mark your answer as being correct")
        }
        .foregroundColor(.white)
        .font(.largeTitle)
        .padding()
        }
    }
}

#Preview {
    AccessibilityView()
}
