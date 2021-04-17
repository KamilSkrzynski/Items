//
//  AccountView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct AccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                
                Text("Create an account to unlock exclusive features such as iCloud synchronize")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                VStack {
                    HStack {
                        Image(systemName: "envelope.fill")
                        TextField("email...", text: $email)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "lock.rectangle.fill")
                        SecureField("password...", text: $password)
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
                            
                            Image(systemName: "arrow.right.square.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.mainColor)
                                .offset(x: 10)
                        }
                        Spacer()
                            .frame(width: proxy.size.width*0.18)
                        Text("Create Account")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(height: 60)
                        Spacer()
                        
                    }
                    .opacity(check() ? 1.0 : 0.3)
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
                        .frame(width: proxy.size.height*0.03)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Create Account")
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.primary)
                                    }))
        }
    }
    
    func check() -> Bool {
        if !password.isEmpty, password.count > 7, !email.isEmpty, email.contains("@") {
            return true
        }
        else {
            return false
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView()
                .preferredColorScheme(.dark)
        }
        NavigationView {
            AccountView()
                .preferredColorScheme(.light)
        }
    }
}
