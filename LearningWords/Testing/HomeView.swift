//
//  HomeView.swift
//  LearningWords
//
//  Created by Dan June on 7/6/25.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {

    @State private var screen: [String] = []
    @State private var handle: AuthStateDidChangeListenerHandle? = nil

    var body: some View {
        NavigationStack(path: $screen) {
            VStack {
                
            }
            .navigationDestination(for: String.self) { s in
                if s == "Content" {
                    SwiftUIView()
                        .navigationBarBackButtonHidden(true)
                    
                } else if s == "Auth" {
                    AuthView()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        .onAppear {
            
            // Listen for the auth state change
            handle = Auth.auth().addStateDidChangeListener { auth, user in
                // Check if user is logged in
                if user != nil {
                    // User is signed in.
                    // if so, screen = [Content]
                    screen = ["Content"]
                } else {
                    // No user is signed in.
                    // else screen = ["Auth"]
                    screen = ["Auth"]
                }
            }
        }
        .onDisappear {
            Auth.auth().removeStateDidChangeListener(handle!)
        }
    }
}

#Preview {
    HomeView()
}
