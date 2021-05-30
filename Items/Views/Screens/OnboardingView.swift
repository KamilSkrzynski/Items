//
//  OnboardingView.swift
//  Items
//
//  Created by Kamil Skrzyński on 03/05/2021.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel = OnboardingViewModel()
    
    
    @AppStorage("isOnboardingWatched") private var isOnboardingToWatch = true

    
    var body: some View {
        GeometryReader { proxy in
        TabView(selection: $viewModel.tabSelection) {
            ForEach(viewModel.views, id: \.self) { view in
            VStack {
                Image(view.image)
                    .resizable()
                    .frame(width: proxy.size.width/1.7, height: proxy.size.height/1.5)
                
                Text(view.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(view.subtitle)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    if view.selection != 0 {
                    Button(action: {
                        withAnimation {
                            viewModel.tabSelection -= 1
                        }
                    }, label: {
                        Text("Previous")
                            .fontWeight(.bold)
                            .frame(width: 110, height: 30)
                            .padding(.horizontal)
                    })
                    .offset(y: -20)
                        
                    }
                    if view.selection != 2 {
                    Button(action: {
                        
                            withAnimation {
                            viewModel.tabSelection += 1
                            }
                    }, label: {
                        Text("Next")
                            .fontWeight(.bold)
                            .frame(width: 110, height: 30)
                            .padding(.horizontal)
                    })
                    .offset(y: -20)
                    }
                }
                .font(.title3)
                .accentColor(.primary)
                
                if view.selection == 2 {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Got it!")
                            .font(.system(size: 30))
                                .fontWeight(.bold)
                                .frame(width: 110, height: 40)
                                .padding(.horizontal)
                    })
                    .accentColor(.primary)
                }
                
                Spacer()
                    
            }
            .tag(view.selection)
            }
        }.tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.isOnboardingToWatch = false
                                        self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text(viewModel.skipButtonTitle)
                    .accentColor(.primary)
            }))
            .navigationTitle(viewModel.title)
        .padding()
    }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OnboardingView()
        }
        
        NavigationView {
            OnboardingView()
        }
        .previewDevice("iPhone 11 Pro")
        
        NavigationView {
            OnboardingView()
        }.previewDevice("iPhone 8")
    }
}
