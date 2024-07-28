//
//  MessagesManager.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 15/06/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    
    @Published var messages: [Message] = []
    let db = Firestore.firestore()
    
    func sendMessage(content: String, senderId: String, chatId: String) {
        let message = Message(content: content, senderId: senderId, timestamp: Date())
        do {
            self.messages.append(message)
            _ = try db.collection("chats").document(chatId).collection("messages").addDocument(from: message)
        } catch {
            print("Error adding messages to firestore: ", error.localizedDescription)
        }
    }
    
    func fetchMessages(recipientId: String) {
        db.collection("chats")
            .whereField("recipientId", isEqualTo: recipientId)
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    return
                }
                
                for document in documents {
                    let chatId = document.documentID
                    self.db.collection("chats").document(chatId).collection("messages")
                        .order(by: "timestamp", descending: false)
                        .getDocuments { (messageSnapshot, error) in
                            if let error = error {
                                print("Error fetching messages from firestore: ", error.localizedDescription)
                                return
                            }
                            if let messageDocuments = messageSnapshot?.documents {
                                for messageDocument in messageDocuments {
                                    if let message = try? messageDocument.data(as: Message.self) {
                                        self.messages.append(message)
                                    }
                                }
                            }
                        }
                }
            }
    }
}
