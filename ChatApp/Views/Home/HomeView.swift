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
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack {
                            ForEach(messageManager.messages, id: \.id) { message in
                                if message.senderId == "self" {
                                    SentMessageBubble(message: message.content)
                                } else {
                                    ReceivedMessageBubble(message: message.content, sender: message.senderId)
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                MessageInput(currentTyping: currentTyping)
                    .environmentObject(messageManager)
                
            }
            .navigationTitle("Group Chat")
        }
    }
}
