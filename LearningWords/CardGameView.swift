//
//  CardGameView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftData
import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct CardGameView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [SortDescriptor(\Unit.title)]) var units: [Unit]
    
    @State private var cards = [Card]()
    @State private var isActive = true
    @State private var selectedUnit = "Placeholder"
    @Binding var score: Int

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray.gradient)
                .ignoresSafeArea(.all)

            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index], score: $score) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(index == cards.count - 1)
                        .accessibilityHidden(index < cards.count - 1)
                    }
                }
                
                if cards.isEmpty {
                    VStack {
                        if selectedUnit != "Placeholder" {
                            Text("Words Correct: \(score)")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        Picker("Units", selection: $selectedUnit) {
                            if selectedUnit == "Placeholder" {
                                Text("Select Unit...")
                                    .tag("Placeholder")
                            }
                            ForEach(units) { unit in
                                Text(unit.title)
                                    .tag(unit.title)
                            }
                            
                        }
                        .padding()
                        .background(.white)
                        .tint(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        if selectedUnit != "Placeholder" {
                            VStack {
                                Button {
                                    setCards(selected: selectedUnit)
                                } label: {
                                    Text("Start")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                }
                                .padding()
                                .buttonStyle(BorderedProminentButtonStyle())
                                .tint(.green)
                            }
                        }
                        
                    }
                }
            }

            if differentiateWithoutColor || voiceOverEnabled {
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
        .onAppear(perform: resetCards)
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func setCards(selected: String) {
        let unit = units.first(where: { $0.title == selected })!
        for word in unit.words {
            cards.append(Card(word: word.text))
        }
        score = 0
    }
        
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        if cards.isEmpty {
            isActive = false
        } else {
            isActive = true
        }
        loadData()
    }
}

#Preview {
    CardGameView(score: .constant(0))
}
