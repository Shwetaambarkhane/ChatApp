//
//  ChatsView.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 21/07/24.
//

import SwiftUI

struct ChatsView: View {
    @StateObject private var viewModel = ChatsViewModel()
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.chats) { chat in
                NavigationLink(destination: HomeView(user: userViewModel.user ?? User(email: "", username: ""), chatId: chat.id)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(userViewModel.user?.username ?? "")
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
                .onAppear {
                    userViewModel.fetchUser(by: chat.recipientId)
                }
            }
            .navigationTitle("Chats")
            .onAppear {
                viewModel.fetchChats()
            }
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
