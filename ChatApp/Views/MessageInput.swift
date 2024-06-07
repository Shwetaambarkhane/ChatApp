//
//  MessageInput.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 07/06/24.
//

import SwiftUI

struct MessageInput: View {
    
    @State private var currentTyping = ""
    @State private var messageArray: [Message]
    
    init(currentTyping: String, messageArray: [Message]) {
        self.currentTyping = currentTyping
        self.messageArray = messageArray
    }
    
    var body: some View {
        HStack {
            TextField("Message", text: $currentTyping)
            Button("Send") {
                messageArray.append(Message(content: currentTyping.trimmingCharacters(in: .whitespacesAndNewlines), sender:"self"))
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
