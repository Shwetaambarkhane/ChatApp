//
//  Chat.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 21/07/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Chat: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var recipientId: String
    var lastMessage: String
    var lastMessageTimestamp: Date
}
