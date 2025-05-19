//
//  MainView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftData
import SwiftUI

struct MainView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Unit]()
    @State private var sortOrder = SortDescriptor(\Unit.title)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Rectangle()
                    .fill(.mint.gradient)
                    .ignoresSafeArea(.all)
                
                UnitListingView(sort: sortOrder, searchString: searchText)
                    .navigationTitle("Unit List")
                    .navigationDestination(for: Unit.self, destination: EditUnit.init)
                    .searchable(text: $searchText)
                    .toolbar {
                        Button("Add Unit", systemImage: "plus", action: addUnit)
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Title")
                                    .tag(SortDescriptor(\Unit.title))
                                
                                Text("Date")
                                    .tag(SortDescriptor(\Unit.createdAt))
                            }
                            .pickerStyle(.inline)
                        }
                    }
            }
        }
        .accentColor(.mint)
    }
    
    func addUnit() {
        let unit = Unit()
        modelContext.insert(unit)
        path = [unit]
    }
}

#Preview {
    MainView()
}
