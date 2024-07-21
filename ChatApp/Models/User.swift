//
//  User.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 21/07/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String = UUID().uuidString
    var email: String
    var username: String
}
