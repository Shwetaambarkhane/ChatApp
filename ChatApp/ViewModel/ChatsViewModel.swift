//
//  ChatsViewModel.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 21/07/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class ChatsViewModel: ObservableObject {
    @Published var chats = [Chat]()
    private var db = Firestore.firestore()
    
    func fetchChats() {
        db.collection("chats").order(by: "lastMessageTimestamp", descending: true).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.chats = documents.compactMap { queryDocumentSnapshot -> Chat? in
                return try? queryDocumentSnapshot.data(as: Chat.self)
            }
        }
    }
}

