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
    func signInAnonymously()
}

final class AuthService: AuthServiceProtocol {
    
    @AppStorage("isSignedIn") private var isSignedIn = false
    
    static let instance = AuthService()
    
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
}
