//
//  CreateUnitView.swift
//  LearningWords
//
//  Created by Dan June on 4/29/25.
//

import SwiftUI

struct CreateUnitView: View {
    @Environment(\.dismiss) var dismiss

    @State var units = [Unit]()
    @State var unit = Unit(title: "", words: [], createdAt: Date())
    
    @State private var wordList: [String] = []
    @State private var newTitle = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Title", text: $newTitle)
                    TextField("Add word to unit", text: $newWord)
                        .textInputAutocapitalization(.never)
                }

                Section {
                    ForEach(wordList, id: \.self) { word in
                        Text(word)
                            .accessibilityElement()
                            .accessibilityLabel(word)
                    }
                }
            }
            .navigationTitle("Create Unit")
            .onSubmit(addNewWord)
            .toolbar {
                Button {
                    addUnit()
                } label: {
                    Text("Add Unit")
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let trimmedWord = newWord.trimmingCharacters(in: .whitespaces)
        guard trimmedWord.count > 0 else { return }
        
        guard !wordList.contains(trimmedWord) else {
            wordError(title: "Duplicate word", message: "This word already exists in the unit.")
            return
        }
        
        withAnimation {
            wordList.insert(trimmedWord, at: 0)
            newWord = ""
        }
        
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(units) {
            UserDefaults.standard.set(data, forKey: "Units")
        }
    }
    
    func addUnit() {
        let trimmedTitle = newTitle.trimmingCharacters(in: .whitespaces)

        let newDate = Date()
        guard trimmedTitle.isEmpty == false else { return }

        let unit = Unit(title: trimmedTitle, words: wordList, createdAt: newDate)
        units.insert(unit, at: 0)
        saveData()
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    CreateUnitView()
}
