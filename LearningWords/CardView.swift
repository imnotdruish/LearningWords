//
//  CardView.swift
//  LearningWords
//
//  Created by Dan June on 5/3/25.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    @State private var feedback = UINotificationFeedbackGenerator()
    @State private var offset = CGSize.zero
    
    let card: Card
    @Binding var score: Int
    var removal: (() -> Void)?
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor
                    ? .white
                    : .white.opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    differentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
            
            VStack {
                if voiceOverEnabled {
                    Text(card.word)
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.black)
                } else {
                    Text(card.word)
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    feedback.prepare()
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width < 0 {
                            feedback.notificationOccurred(.error)
                        }
                        if offset.width > 100 {
                            score += 1
                        }
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
            )
        .animation(.spring(), value: offset)

    }
}

#Preview {
    CardView(card: .example, score: .constant(0))
}
