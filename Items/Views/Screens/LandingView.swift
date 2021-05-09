//
//  LandingView.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("ITEMS")
                    .font(.system(size: 50, weight: .bold))
                    .animation(.default)
                Text("Track things you want to buy")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .animation(.default)
                
                Spacer()
                NavigationLink(
                    destination: TabContainerView())
                    {
                    
                
                Button(action: {
                    AuthService.instance.signInAnonymously()
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
            }
            .shadow(radius: 3)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
