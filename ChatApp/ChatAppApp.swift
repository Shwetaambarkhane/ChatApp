//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 07/06/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct ChatAppApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    
    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

extension ChatAppApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
