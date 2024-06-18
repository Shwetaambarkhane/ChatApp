//
//  HomeView.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 09/06/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var messageManager = MessagesManager()
    
    @State private var currentTyping = ""
    @State private var messageArray: [Message] = [
        Message(content: "Temporary message", sender: "Alex"),
        Message(content: "Self message", sender: "self"),
        Message(content: "Other person message", sender: "Hailey")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack {
                            ForEach(messageManager.messages, id: \.id) { message in
                                if message.sender == "self" {
                                    SentMessageBubble(message: message.content)
                                } else {
                                    ReceivedMessageBubble(message: message.content, sender: message.sender)
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                MessageInput(currentTyping: currentTyping, messageArray: $messageArray)
                
            }
            .navigationTitle("Group Chat")
        }
    }
}
