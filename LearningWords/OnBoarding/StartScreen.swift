//
//  StartScreen.swift
//  LearningWords
//
//  Created by Dan June on 5/27/25.
//

import SwiftUI

struct StartScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var score: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(colorScheme == .dark ? Color.white.gradient : Color.black.gradient)
                    .rotationEffect(Angle(degrees: 80))
                    .offset(x: 0, y: -350)
                
                Rectangle()
                    .fill(.mint.gradient)
                    .rotationEffect(Angle(degrees: 290))
                    .offset(x: 0, y: -400)
                
                Rectangle()
                    .fill(.gray.gradient)
                    .rotationEffect(Angle(degrees: 110))
                    .offset(x: 10, y:-500)

                VStack {
                    Spacer()
                    
                    Text("Learning Words")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(.mint)
                    
                    Image("LearningWords")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    NavigationLink(destination: Login()) {
                        Text("Continue")
                    }
                    .padding()
                    .background(.mint)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    StartScreen(score: .constant(0))
}
