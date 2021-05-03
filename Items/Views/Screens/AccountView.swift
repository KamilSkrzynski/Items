//
//  AccountView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel: AccountViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordAgain: String = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Text(viewModel.subtitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
            
            VStack {
                HStack {
                    Image(systemName: viewModel.emailIconImage)
                    TextField(viewModel.emailPlaceholderText, text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding()
                
                HStack {
                    Image(systemName: viewModel.passwordIconImage)
                    SecureField(viewModel.passwordPlaceholderText, text: $password)
                        .autocapitalization(.none)
                }
                .padding()
                if viewModel.title == "Create Account" {
                HStack {
                    Image(systemName: viewModel.passwordIconImage)
                    SecureField(viewModel.passwordAgainPlaceholderText, text: $passwordAgain)
                        .autocapitalization(.none)
                }
                .padding()
                }
            }
            .background(Color.grayColor)
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: viewModel.buttonIconImage)
                        .font(.system(size: 30))
                        .foregroundColor(.clear)
                    Spacer()
                    Text(viewModel.buttonTitle)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: viewModel.buttonIconImage)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                    
                }
                .padding()
                .frame(height: 60)
            })
            .frame(maxWidth: .infinity)
            .background(Color.appColor)
            .accentColor(.primary)
            .padding(.vertical)
            .opacity(withAnimation {
                viewModel.isValidEmail(email) && viewModel.isValidPassword(password)  && viewModel.isPasswordMatching(password, passwordAgain) ? 1.0 : 0.3

    })
            
            Text("Privacy Policy")
                .font(.footnote)
                .foregroundColor(.gray)
            
            
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.title)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView(viewModel: .init(mode: .login))
                .preferredColorScheme(.dark)
        }
        NavigationView {
            AccountView(viewModel: .init(mode: .signup))
                .preferredColorScheme(.light)
        }
    }
}
