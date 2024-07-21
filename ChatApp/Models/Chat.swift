//
//  Chat.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 21/07/24.
//

import Foundation

struct Chat: Identifiable, Codable {
    var id: String = UUID().uuidString
    var participants: [String]
    var messages: [Message]
}
