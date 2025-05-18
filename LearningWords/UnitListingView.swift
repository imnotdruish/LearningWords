//
//  UnitListingView.swift
//  LearningWords
//
//  Created by Dan June on 5/18/25.
//

import SwiftData
import SwiftUI

struct UnitListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Unit.createdAt), SortDescriptor(\Unit.title)]) var units: [Unit]
    
    var body: some View {
        List {
            ForEach(units) { unit in
                NavigationLink(value: unit) {
                    VStack(alignment: .leading) {
                        UnitListCard(unit: unit)
                    }
                }
            }
            .onDelete(perform: deleteUnit)
        }
    }
    
    init(sort: SortDescriptor<Unit>, searchString: String) {
        
        _units = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.title.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteUnit(_ indexSet: IndexSet) {
        for index in indexSet {
            let unit = units[index]
            modelContext.delete(unit)
        }
    }
}

#Preview {
    UnitListingView(sort: SortDescriptor(\Unit.title), searchString: "")
}
