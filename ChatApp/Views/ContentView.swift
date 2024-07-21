//
//  ContentView.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 07/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
//        switch viewModel.state {
//        case .signedIn: ChatsView()
//        case .signedOut: LoginView()
//        }
        ChatsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
