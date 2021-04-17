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
    
    var body: some View {
        GeometryReader { proxy in
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
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: viewModel.passwordIconImage)
                        SecureField(viewModel.passwordPlaceholderText, text: $password)
                    }
                    .padding()
                }
                .background(Color.grayColor)
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.secondaryColor)
                                .offset(x: 10)
                            
                            Image(systemName: viewModel.buttonIconImage)
                                .font(.system(size: 30))
                                .foregroundColor(.mainColor)
                                .offset(x: 10)
                        }
                        Spacer()
                            .frame(width: viewModel.buttonTitle == "Log In" ? proxy.size.width*0.30 : proxy.size.width*0.28)
                        Text(viewModel.buttonTitle)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(height: 60)
                        Spacer()
                        
                    }
                    .opacity(viewModel.isValidEmail(email) && viewModel.isValidPassword(password) ? 1.0 : 0.3)
                })
                .frame(maxWidth: .infinity)
                .background(Color.grayColor)
                .accentColor(.primary)
                .padding(.vertical)
                
                HStack {
                    Text("Privacy Policy")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Spacer()
                        .frame(width: proxy.size.height*0.001)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(viewModel.title)
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: viewModel.closeIconImage)
                                            .foregroundColor(.primary)
                                    }))
        }
    }
    
//    func check() -> Bool {
//        if !password.isEmpty, password.count > 7, !email.isEmpty, email.contains("@") {
//            return true
//        }
//        else {
//            return false
//        }
//    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView(viewModel: .init(mode: .login, isPushed: .constant(false)))
                .preferredColorScheme(.dark)
        }
        NavigationView {
            AccountView(viewModel: .init(mode: .signup, isPushed: .constant(false)))
                .preferredColorScheme(.light)
        }
    }
}
