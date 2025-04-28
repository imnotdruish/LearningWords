//
//  UnitListView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI

struct UnitListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var units = [Unit]()
    @State private var newTitle = ""
    @State private var newWords = ""
        
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Title", text: $newTitle)
                    TextField("Add words separated by commas", text: $newWords)
                    Button("Add Unit", action: addUnit)
                }
                
                Section {
                    ForEach(0..<units.count, id: \.self) { index in
                        NavigationLink {
                            UnitDetailView(unit: units[index])
                        } label: {
                            VStack(alignment: .leading) {
                                Text(units[index].title)
                                    .font(.headline)
                                    .foregroundStyle(.primary)
                                Text("\(units[index].createdAt, style: .date)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: deleteUnit)
                }
            }
            .navigationTitle("Unit List")
            .onAppear(perform: loadData)
        }
    }
    
    func done() {
        dismiss()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Units") {
            if let decoded = try? JSONDecoder().decode([Unit].self, from: data) {
                units = decoded
            }
        }
    }

    func saveData() {
        if let data = try? JSONEncoder().encode(units) {
            UserDefaults.standard.set(data, forKey: "Units")
        }
    }
    
    func addUnit() {
        let trimmedTitle = newTitle.trimmingCharacters(in: .whitespaces)
        let separatedWords = newWords.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }

        newWords = ""
        newTitle = ""

        let newDate = Date()
        guard trimmedTitle.isEmpty == false && separatedWords.isEmpty == false else { return }

        let unit = Unit(title: trimmedTitle, words: separatedWords, createdAt: newDate)
        units.insert(unit, at: 0)
        saveData()
    }
    
    func deleteUnit(at offsets: IndexSet) {
        units.remove(atOffsets: offsets)
        saveData()
    }
}

#Preview {
    UnitListView()
}
