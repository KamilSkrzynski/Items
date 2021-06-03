//
//  LandingViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 09/05/2021.
//

import SwiftUI

final class LandingViewModel: ObservableObject {
    
    private let authService: AuthServiceProtocol
    @Published var loginPushed = false
    
    @Published var isLoading = false
    let iconImage = "Landing"
    let title = "I T E M S"
    let subtitle = "Track things you want to buy"
    let backgroundImage = "Background"
    
    let buttonImageName = "arrow.right"
    let buttonTitle = "Get Started"
    
    let alreadyButtonText = "Already have an account?"
    let signInButtonText = "Sign in"
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    func getStartedTapped() {
        isLoading = true
        self.authService.signInAnonymously() { success in
            if success {
                self.isLoading = false
            }
            else {
                self.isLoading = true
            }
        }
    }
}
