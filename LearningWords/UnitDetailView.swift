//
//  UnitDetailView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI

struct UnitDetailView: View {

    @State var unit: Unit
    @State private var addedWord = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Created: \(unit.createdAt, style: .date)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("Add a word...", text: $addedWord)
                }
                
                Section {
                    List {
                        ForEach(unit.words, id:\.self) { word in
                            Text(word)
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle(unit.title)
            .toolbar {
                EditButton()
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(unit) {
            UserDefaults.standard.set(data, forKey: "Words")
        }
    }
        
    func delete(at offsets: IndexSet) {
        unit.words.remove(atOffsets: offsets)
    }
}

#Preview {
    UnitDetailView(unit: .example)
}
