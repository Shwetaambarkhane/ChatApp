//
//  MessageInput.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 07/06/24.
//

import SwiftUI

struct MessageInput: View {
    
    @EnvironmentObject var messageManager: MessagesManager
    @State var currentTyping = ""
    
    var body: some View {
        HStack {
            TextField("Start typing...", text: $currentTyping)
            Button("Send") {
                messageManager.sendMessage(text: currentTyping, sender: "self")
                currentTyping = ""
            }
            .padding(.leading, 5)
            .font(.body.bold())
            .disabled(currentTyping.isEmpty)
        }
        .padding()
        .padding(.top, -8)
    }
}
