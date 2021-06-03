//
//  LandingView.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import SwiftUI

struct LandingView: View {
    
    @StateObject private var viewModel = LandingViewModel()
    
    var backgroundImage: some View {
        Image(viewModel.backgroundImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(Color.black.opacity(0.7))
    }
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        }
        else {
            GeometryReader { proxy in
                NavigationView {
                    VStack {
                        Spacer().frame(height: proxy.size.height*0.08)
                        Image(viewModel.iconImage)
                            .resizable()
                            .opacity(0.95)
                            .frame(width: 150, height: 150)
                        Text(viewModel.title)
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .bold))
                        Text(viewModel.subtitle)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.grayColor).opacity(0.6)
                        Spacer()
                        NavigationLink(
                            destination: TabContainerView())
                        {
                            
                            
                            Button(action: {
                                viewModel.getStartedTapped()
                            }, label: {
                                HStack {
                                    Image(systemName: viewModel.buttonImageName)
                                        .font(.system(size: 25))
                                        .foregroundColor(.clear)
                                        .padding()
                                    Spacer()
                                    Text(viewModel.buttonTitle)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                    Spacer()
                                    Image(systemName: viewModel.buttonImageName)
                                        .font(.system(size: 25))
                                        .foregroundColor(.white).padding()
                                }
                                .frame(height: 60)
                                .background(Color.appColor)
                                .padding(.horizontal)
                                .padding(.vertical, 6)
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
                                    Text(viewModel.alreadyButtonText)
                                        .foregroundColor(.white.opacity(0.7))
                                    Text(viewModel.signInButtonText)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.grayColor)
                                }
                            })
                            .accentColor(.primary)
                        }
                    }
                    .padding(.bottom, 15)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .background(backgroundImage
                                    .frame(width: proxy.size.width)
                                    .edgesIgnoringSafeArea(.all)
                    )
                }
            }
            .accentColor(.primary)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .previewDevice("iPhone 8")
        LandingView()
            .previewDevice("iPhone 12")
        LandingView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
