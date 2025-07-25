//
//  MainView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

//import SwiftData
//import SwiftUI
//import FirebaseFirestore
//
//struct MainView: View {
//    let db = Firestore.firestore()
//
//    @Environment(\.modelContext) var modelContext
//    @State private var sortOrder = SortDescriptor(\Unit.title)
//    @State private var searchText = ""
//    @State private var path = [Unit]()
//
//    var body: some View {            
//        NavigationStack(path: $path) {
//            UnitListingView(sort: sortOrder, searchString: searchText)
//                .navigationTitle("Unit List")
//                .navigationDestination(for: Unit.self, destination: EditUnitView.init)
//                .searchable(text: $searchText)
//                .toolbar {
//                    Button("Add Unit", systemImage: "plus", action: addUnit)
//                    
//                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
//                        Picker("Sort", selection: $sortOrder) {
//                            Text("Title")
//                                .tag(SortDescriptor(\Unit.title))
//                            
//                            Text("Date Oldest")
//                                .tag(SortDescriptor(\Unit.createdAt))
//                            
//                            Text("Date Newest")
//                                .tag(SortDescriptor(\Unit.createdAt, order: .reverse))
//
//                        }
//                        .pickerStyle(.inline)
//                    }
//                }
//        }
//        .accentColor(.mint)
//    }
//    
//    init() {
//        // Large Navigation Title
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemMint]
//        // Inline Navigation Title
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemMint]
//   }
//    
//    func addUnit() {
//        let unit = Unit()
//        modelContext.insert(unit)
//        path = [unit]
//    }
//}
//
//#Preview {
//    MainView()
//}
