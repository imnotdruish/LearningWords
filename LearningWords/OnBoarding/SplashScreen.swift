//
//  SplashScreen.swift
//  LearningWords
//
//  Created by Dan June on 7/5/25.
//

import SwiftUI

struct SplashScreen: View {

    @Binding var score: Int
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                StartScreen(score: $score)
            } else {
                Rectangle()
                    .fill(.mint.gradient)
                    .ignoresSafeArea()
                
                VStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    Text("Imnotdruish")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)

                    Text("Software")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen(score: .constant(0))
}
