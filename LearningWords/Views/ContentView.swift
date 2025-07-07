//
//  ContentView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

//import SwiftData
//import SwiftUI
//
//struct ContentView: View {
//    @State private var selection = TabType.units
//    @Binding var score: Int
//    
//    var body: some View {
//        TabView(selection: $selection) {
//            MainView()
//                .tabItem {
//                    VStack {
//                        Text("Units")
//                        Image(systemName: "list.bullet")
//                    }
//                }
//            CardGameView(score: $score)
//                .tabItem {
//                    VStack {
//                        Text("Cards")
//                        Image(systemName: "square.stack.3d.down.right.fill")
//                    }
//                }
//        }
//        .accentColor(.green)
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//#Preview {
//    ContentView(score: .constant(0))
//}
