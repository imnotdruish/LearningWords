//
//  MainView.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                Tab("Units", systemImage: "list.bullet") {
                    UnitListView()
                }
                Tab("Cards", systemImage: "square.stack.3d.down.right.fill") {
                    CardGameView()
                }
                .tabPlacement(.automatic)
            }
            .accentColor(.green)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
