//
//  User.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 21/07/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var email: String
    var username: String
}
