//
//  ContentView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Learning Words")
                    .font(.largeTitle)
                    .bold()

                Text("Flash card game to learn words.")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                NavigationLink {
                    MainView()
                } label: {
                    Text("Click to Begin!")
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.green)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}
