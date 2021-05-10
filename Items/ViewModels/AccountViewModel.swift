//
//  AccountViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Binding var isPushed: Bool
    private let mode: Mode
    private let authService: AuthServiceProtocol
    
    init(mode: Mode,
         authService: AuthServiceProtocol = AuthService(),
         isPushed: Binding<Bool>) {
        self.mode = mode
        self.authService = authService
        self._isPushed = isPushed
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""
    
    let emailPlaceholderText = "email"
    let passwordPlaceholderText = "password"
    let passwordAgainPlaceholderText = "password again"
    let emailIconImage = "envelope.fill"
    let passwordIconImage = "lock.rectangle.fill"
    let buttonIconImage = "arrow.right.square.fill"
    let closeIconImage = "xmark"
    
    var title: String {
        switch mode {
        case .login:
            return "Log In"
        case .signup:
            return "Create Account"
        }
    }
    
    var subtitle: String {
        switch mode {
        case .login:
            return "Log into your account"
        case .signup:
            return "Create an account to unlock exclusive features such as iCloud synchronize"
        }
    }
    
    var buttonTitle: String {
        switch mode {
        case .login:
            return "Log In"
        case .signup:
            return "Sign Up"   
        }
    }
    
    func tappedActionButton()  {
        switch mode {
        case .login:
            authService.login(email: email, password: password)
            self.isPushed = false
        case .signup:
            authService.linkAccount(email: email, password: password)
            self.isPushed = false
        }
    }
    
    func buttonOpacity() -> Double {
        switch mode {
        case .login:
            return isValidEmail(email) && isValidPassword(password) ? 1.0 : 0.3
        case .signup:
           return isValidEmail(email) && isValidPassword(password)  && isPasswordMatching(password, passwordAgain) ? 1.0 : 0.3
        }
    }
}

extension AccountViewModel {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email) && email.count > 5
    }
    
    func isValidPassword(_ password: String) -> Bool {
        return password.count > 5
    }
    
    func isPasswordMatching(_ password1: String, _ password2: String) -> Bool {
        if password1 == password2 {
            return true
        }
        return false
    }
}

extension AccountViewModel {
    enum Mode {
        case login
        case signup
    }
}
