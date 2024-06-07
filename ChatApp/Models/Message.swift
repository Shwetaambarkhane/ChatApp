//
//  Message.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 07/06/24.
//

import Foundation

struct Message: Identifiable, Equatable {
    let id = UUID()
    let content: String
    let sender: String
}
