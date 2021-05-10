//
//  AuthService.swift
//  Items
//
//  Created by Kamil Skrzyński on 02/05/2021.
//

import Foundation
import FirebaseAuth
import SwiftUI

protocol AuthServiceProtocol {
    var currentUser: User? { get }
    func signInAnonymously()
    func linkAccount(email: String, password: String)
    func logout()
    func login(email: String, password: String)
}

final class AuthService: AuthServiceProtocol {
    
    // MARK: Properties
    @AppStorage("isSignedIn") private var isSignedIn = false
    
    let currentUser = Auth.auth().currentUser
    
    // MARK: Functions
    
    func linkAccount(email: String, password: String) {
        let emailCredential = EmailAuthProvider.credential(withEmail: email, password: password)
        Auth.auth().currentUser?.link(with: emailCredential, completion: { authResult, error in
            if let error = error {
                print("Unable to link account with credential: \(error)")
                return
            }
            else if let user = authResult?.user {
                Auth.auth().updateCurrentUser(user) { error in
                    if let error = error {
                        print("Unable to update current user in Database: \(error)")
                        return
                    }
                    //Good to go
                }
            }
        })
    }
    
    func signInAnonymously() {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                print("Error singing in anonymously: \(error)")
                return
            }
            else {
                self.isSignedIn = true
                print("Successfully signed in anonymously")
                return
            }
            
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.isSignedIn = false
        }
        catch {
            print("Error logging out: \(error)")
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing in to Database: \(error)")
                return
            }
            else {
                self.isSignedIn = true
                print("Successfully logged in with email \(email)")
                return
            }
        }
    }
}
