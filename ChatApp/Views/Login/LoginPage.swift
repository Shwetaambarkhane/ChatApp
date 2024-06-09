//
//  LoginPage.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 09/06/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
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
            
            Button("Click to continue") {
                
            }
            .padding()
            .foregroundColor(Color(.black))
            .background(
                RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color(UIColor(red: 0, green: 230/255, blue: 210/255, alpha: 1)))
            )
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
