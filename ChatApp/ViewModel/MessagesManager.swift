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
    
    @Published private(set) var messages: [Message] = []
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error printing docs - \(error?.localizedDescription ?? "Not valid error")")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error converting docs to Messages - \(error.localizedDescription)")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp }
        }
    }
}
