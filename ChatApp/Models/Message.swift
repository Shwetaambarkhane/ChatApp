//
//  Message.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 07/06/24.
//

import Foundation

struct Message: Identifiable, Equatable, Codable {
    var id: String = UUID().uuidString
    var content: String
    var sender: String
    var timestamp: Date = Date()
}
