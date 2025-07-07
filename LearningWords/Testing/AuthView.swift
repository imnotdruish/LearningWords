//
//  AuthView.swift
//  LearningWords
//
//  Created by Dan June on 7/6/25.
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    
    @State private var mode = 0
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""
    
    var body: some View {
        VStack {
            Picker("Login or Register", selection: $mode) {
                Text("Login")
                    .tag(0)
                Text("Register")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            
            Text(errorMessage)
                .foregroundStyle(.red)
            
            if mode == 0 {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                Button("Login") {
                    // Log in
                    loginUser()
                }
            } else {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                SecureField("Confirm Password", text: $confirmPassword)
                    .textContentType(.password)
                Button("Register") {
                    // Register
                    registerUser()
                }
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
    
    func loginUser() {
        Task {
            do {
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if error != nil {
                        errorMessage = error!.localizedDescription
                    } else {
                        // User is signed in
                    }
                }
            }
//            catch {
//                // Error calling sign in
//                errorMessage = error.localizedDescription
//            }
        }
    }
    
    func registerUser() {
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                errorMessage = error!.localizedDescription
            } else {
                // User is created
            }
        }
    }
}

#Preview {
    AuthView()
}
