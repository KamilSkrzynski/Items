//
//  LandingView.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                
                ZStack {
                    
                    Rectangle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.primary)
                        .offset(x: 10, y: 10)
                    Image("logo")
                            .resizable()
                        .frame(width: 150, height: 150)
                }
                Gradient.primaryGradient
                    .mask(VStack {
                        Text("ITEMS")
                        .font(.system(size: 50))
                            .fontWeight(.bold)
                    }).frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding()
                Text("Track things you want to buy")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                NavigationLink(
                    destination:
                        TabContainerView(),
                    label: {
                        Gradient.primaryGradient
                            .mask(
                                Text("Get Started")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            )
                            .background(Color.grayColor)
                            .frame(height: 60)
                    })
            }
            .padding()
        }
        }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .preferredColorScheme(.dark)
            
    }
}
