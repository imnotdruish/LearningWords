//
//  EditUnitView.swift
//  LearningWords
//
//  Created by Dan June on 5/18/25.
//

import SwiftData
import SwiftUI

struct EditUnitView: View {
    @Bindable var unit: Unit
    @State private var newWord = ""
    
    var body: some View {
        Form {
            TextField("Unit", text: $unit.title)
            
            Section("Words") {
                ForEach(unit.words) { word in
                    Text(word.text)
                }
                .onDelete(perform: deleteWord)
                
                HStack {
                    TextField("Add a new word", text: $newWord)
                        .textInputAutocapitalization(.never)
                    Button("Add", action: addWord)
                }
            }
        }
        .navigationTitle("Edit Unit")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addWord() {
        guard newWord.isEmpty == false else { return }
        guard unit.words.contains(where: { $0.text == newWord }) == false else { return }
        
        withAnimation {
            let word = Word(text: newWord)
            unit.words.append(word)
            newWord = ""
        }
    }
    
    func deleteWord(_ indexSet: IndexSet) {
        for index in indexSet {
            unit.words.remove(at: index)
        }
    }
}
