//
//  Login.swift
//  LearningWords
//
//  Created by Dan June on 7/5/25.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.mint.gradient)
                .ignoresSafeArea()
            
            VStack {
                Image("LearningWords")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, -30)
                
                Text("Learning Words")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
            }

            Form {
                Spacer()
                TextField("email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                TextField("password", text: $password)
                    .textContentType(.password)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    login()
                } label: {
                    Spacer()
                    Text("Login")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.gray.gradient)
                
                NavigationLink {
                    CreateAccount()
                } label: {
                    Spacer()
                    Text("No Account? Create One.")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
            .formStyle(.columns)
            .padding(.horizontal, 30)
            .padding(.bottom, 100)
            .background(Color.clear)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func login() {
        print("Logged In")
    }
}

#Preview {
    Login()
}
