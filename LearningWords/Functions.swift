//
//  Functions.swift
//  LearningWords
//
//  Created by Dan June on 5/5/25.
//

import SwiftUI

func removeCard(at index: Int) {
    @State var selectedUnit: Bool
    @State var cards = [Card]()

    guard index >= 0 else { return }
    cards.remove(at: index)
        
    if cards.isEmpty {
        selectedUnit = false
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}
