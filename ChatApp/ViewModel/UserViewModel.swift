//
//  UserViewModel.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 22/07/24.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserViewModel: ObservableObject {
    @Published var user: User?
    private var db = Firestore.firestore()
    
    func fetchUser(by userId: String) {
        db.collection("users").document(userId).getDocument { (document, error) in
            if let document = document, document.exists {
                self.user = try? document.data(as: User.self)
            }
        }
    }
    
    func getUser(by userId: String) -> User? {
        fetchUser(by: userId)
        return user
    }
}
