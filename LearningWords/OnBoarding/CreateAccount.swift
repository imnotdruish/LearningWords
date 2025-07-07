//
//  CreateAccount.swift
//  LearningWords
//
//  Created by Dan June on 7/5/25.
//

import SwiftUI

struct CreateAccount: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var reenterPassword: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var useCase: String? = nil
    @State private var ageRange: String? = nil
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.mint.gradient)
                .ignoresSafeArea()
            
            VStack {
                ScrollView(showsIndicators: false) {
                    Form {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Section("Account Information") {
                                TextField("email", text: $email)
                                TextField("password", text: $password)
                                TextField("re-enter password", text: $reenterPassword)
                            }
                            .textFieldStyle(.roundedBorder)
                            
                            Spacer()
                            
                            Section("Personal Information") {
                                TextField("First Name", text: $firstName)
                                TextField("Last Name", text: $lastName)
                            }
                            .textFieldStyle(.roundedBorder)
                        }
                        .padding(.bottom, 20)

                        VStack(alignment: .leading, spacing: 10) {
                            Section("Additional Details") {

                                Text("Reason:")
                                Picker("Use Case (optional)", selection: $useCase) {
                                    Text("Educator")
                                        .tag("educator")
                                    Text("Personal")
                                        .tag("personal")
                                }
                                
                                Text("Age Range:")
                                Picker("Age Range (optional)", selection: $ageRange) {
                                    Text("pre-K")
                                        .tag("preK")
                                    Text("Kindergarten")
                                        .tag("k")
                                    Text("1st-4th")
                                        .tag("elementary")
                                    Text("5th-8th")
                                        .tag("middle")
                                    Text("9th-12th")
                                        .tag("highSchool")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                    }
                    .formStyle(.columns)
                    .background(Color.clear)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 60)
                    
                    Button("Create Account", action: {
                        createAccount()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(Color.gray.gradient)
                    
                    NavigationLink {
                        Login()
                    } label: {
                        Text("Already have an account?")
                    }
                }
            }
            .foregroundStyle(.white)
            .bold()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func createAccount() {
        print("Account Created")
    }
}

#Preview {
    CreateAccount()
}
