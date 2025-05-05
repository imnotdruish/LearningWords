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
    @State private var modifyUnit = false
        
    var body: some View {
        NavigationView {
            ZStack {
                List {
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
                .navigationTitle("Unit List")
                .sheet(isPresented: $modifyUnit, onDismiss: loadData, content: CreateUnitView.init)
                .onAppear(perform: loadData)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        Button {
                            modifyUnit = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .padding()
                                .background(.green.opacity(0.8))
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
            }
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
    
    func deleteUnit(at offsets: IndexSet) {
        units.remove(atOffsets: offsets)
        saveData()
    }
}

#Preview {
    UnitListView()
}
