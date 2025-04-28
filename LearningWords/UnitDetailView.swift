//
//  UnitDetailView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI

struct UnitDetailView: View {
    @State var unit: Unit
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Created: \(unit.createdAt, style: .date)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Section {
                    List {
                        ForEach(unit.words, id:\.self) { word in
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(unit.title)
        }
    }
}

#Preview {
    UnitDetailView(unit: .example)
}
