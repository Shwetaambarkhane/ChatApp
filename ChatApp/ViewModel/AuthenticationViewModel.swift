//
//  AuthenticationViewModel.swift
//  ChatApp
//
//  Created by Shweta Ambarkhane on 09/06/24.
//

import Firebase
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {
    
    @Published var state: Bool = UserDefaults.standard.bool(forKey: "SignedIn")
    var currentUser: User?
    
    func signIn() {
        // 1
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // 3
            let configuration = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = configuration
            
            // 4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            // 5
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] authentication, error in
                self?.authenticateUser(for: authentication?.user, with: error)
                if let user = authentication?.user, let profile = user.profile, let userId = user.userID {
                    self?.currentUser = User(id: userId, email: profile.email, username: profile.name)
                }
            }
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        // 1
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        // 2
        guard let user = user, let idToken = user.idToken?.tokenString else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        
        // 3
        Auth.auth().signIn(with: credential) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                UserDefaults.standard.set(true, forKey: "SignedIn")
            }
        }
    }
    
    func signOut() {
        // 1
        GIDSignIn.sharedInstance.signOut()
        
        do {
            // 2
            try Auth.auth().signOut()
            self.currentUser = nil
            
            UserDefaults.standard.set(false, forKey: "SignedIn")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
