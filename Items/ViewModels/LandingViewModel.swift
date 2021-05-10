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
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    func getStartedTapped() {
        self.authService.signInAnonymously()
    }
}
