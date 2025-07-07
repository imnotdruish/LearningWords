//
//  SwiftUIView.swift
//  LearningWords
//
//  Created by Dan June on 7/6/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct SwiftUIView: View {
    let db = Firestore.firestore()
    
    @State var textContent = "Hello, World!"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(textContent)
            Button("Log Out") {
                try? Auth.auth().signOut()
            }
            
        }
        .padding()
        .task {
            do {
                let snapshot = try await db.collection("units")
                    .whereFilter(Filter.orFilter([
                        Filter.whereField("title", isEqualTo: "Unit 3"),
                        Filter.whereField("title", isEqualTo: "Unit One"),
                        Filter.whereField("created", isGreaterThan: Date(timeIntervalSinceNow: -60))
                    ]))
                    .getDocuments()
                
                for doc in snapshot.documents {
                    let unit = try? doc.data(as: Unit.self)
                    if unit != nil {
                        textContent = "Unit: \(unit)"
                    }
                }
            } catch {
                print("Error decoding unit: \(error)")
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
