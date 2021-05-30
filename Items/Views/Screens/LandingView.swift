//
//  LandingView.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import SwiftUI

struct LandingView: View {
    
    @StateObject private var viewModel = LandingViewModel()
    
    var body: some View {
        GeometryReader { proxy in
        NavigationView {
            VStack {
                Spacer().frame(height: proxy.size.height*0.2)
                Image("Landing")
                    .resizable()
                    .opacity(0.95)
                    .frame(width: 150, height: 150)
                Text("I T E M S")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
                Text("Track things you want to buy")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.grayColor).opacity(0.6)
                Spacer().frame(height: proxy.size.height*0.33)
                NavigationLink(
                    destination: TabContainerView())
                    {
                    
                
                Button(action: {
                    viewModel.getStartedTapped()
                }, label: {
                    HStack {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 25))
                            .foregroundColor(.clear)
                            .padding()
                        Spacer()
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .font(.title2)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.system(size: 25))
                            .foregroundColor(.white).padding()
                    }
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.appColor)
                    .padding()
                })
                }
                
                NavigationLink(
                    destination: AccountView(viewModel: .init(mode: .login, isPushed: $viewModel.loginPushed))
                        .accentColor(.primary),
                    isActive: $viewModel.loginPushed){
                        Button(action: {
                            viewModel.loginPushed = true
                        }, label: {
                            HStack {
                                Text("Already have account?")
                                    .foregroundColor(.white.opacity(0.7))
                                Text("Sign in")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.grayColor)
                            }
                        })
                        .accentColor(.primary)
                    }
                Spacer()
            }
            .background(Image("Background")
                            .scaledToFit()
                            .overlay(Color.black.opacity(0.6)))
            .ignoresSafeArea(.all)
        }
        }
        .accentColor(.primary)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
