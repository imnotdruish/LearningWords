//
//  LearningWordsApp.swift
//  LearningWords
//
//  Created by Dan June on 4/28/25.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct LearningWordsApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var score: Int = 0
    
    var body: some Scene {
        WindowGroup {
            HomeView()
//            SplashScreen(score: $score)
        }
//        .modelContainer(for: Unit.self)
    }
}
