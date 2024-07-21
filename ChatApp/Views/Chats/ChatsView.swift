//
//  ChatsView.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 21/07/24.
//

import SwiftUI

struct ChatsView: View {
    @StateObject private var viewModel = ChatsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.chats) { chat in
                NavigationLink(destination: ChatDetailView(chat: chat)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(chat.recipientId)
                                .font(.headline)
                            Text(chat.lastMessage)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(chat.lastMessageTimestamp, style: .time)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Chats")
            .onAppear {
                viewModel.fetchChats()
            }
        }
    }
}

struct ChatDetailView: View {
    var chat: Chat
    
    var body: some View {
        Text("Chat with \(chat.recipientId)")
            .navigationTitle("Chat")
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
