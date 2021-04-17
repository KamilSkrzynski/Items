//
//  AccountViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    private let mode: Mode
    @Binding var isPushed: Bool
    
    init(mode: Mode, isPushed: Binding<Bool>) {
        self.mode = mode
        self._isPushed = isPushed
    }
    
    let emailPlaceholderText = "email"
    let passwordPlaceholderText = "password"
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
}

extension AccountViewModel {
    enum Mode {
        case login
        case signup
    }
}
