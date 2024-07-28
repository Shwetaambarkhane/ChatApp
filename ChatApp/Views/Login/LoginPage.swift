//
//  LoginPage.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 09/06/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State private var username = ""
    @State private var password = ""
    @State var isSignedIn: Bool = false
    
    var body: some View {
        if isSignedIn {
            ChatsView()
                .environmentObject(viewModel)
        } else {
            VStack {
                Image("login_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Welcome to ChatApp")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text("Connect with people")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                
                // 3
                GoogleSignInButton()
                    .padding()
                    .onTapGesture {
                        self.isSignedIn = true
                        viewModel.signIn()
                    }
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
