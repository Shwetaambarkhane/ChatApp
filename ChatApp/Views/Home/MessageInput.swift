//
//  MessageInput.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 07/06/24.
//

import SwiftUI

struct MessageInput: View {
    
    @EnvironmentObject var messageManager: MessagesManager
    @State var chatId: String?
    @State var currentTyping = ""
    
    var body: some View {
        HStack {
            TextField("Start typing...", text: $currentTyping)
            Button("Send") {
                if let chatId = chatId {
                    messageManager.sendMessage(content: currentTyping, senderId: "self", chatId: chatId)
                } else {
                    print("recipientId is nil")
                }
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
