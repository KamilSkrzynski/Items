//
//  UsageView.swift
//  Items
//
//  Created by Kamil Skrzyński on 02/06/2021.
//

import SwiftUI

struct UsageView: View {
    
    @AppStorage("userID") private var userID = ""
    @AppStorage("isDarkMode") private var isDarkMode = false
    @ObservedObject private var viewModel = UsageViewModel()
    
    @State private var collectionPercentage: CGFloat = 0.0
    @State private var itemsPercentage: CGFloat = 0.0
    @State var showProView: Bool = false
    
    var body: some View {
        Text(viewModel.headline)
            .animation(.none)
            .font(.headline)
            .foregroundColor(.gray)
        ScrollView {
            VStack {
                Spacer()
                    Text(viewModel.headline2)
                        .animation(.none)
                        .font(.callout)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                
          Divider()
                        HStack {
                            Text("Collections")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                            Spacer()
                            ProgressCircleView(type: "collections")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 9)
                Divider()
                        HStack {
                            Text("Items")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                            Spacer()
                            ProgressCircleView(type: "items")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 9)
                Divider()
                Text("If you want to unlock full potential of ITEMS become a PRO")
                        .animation(.none)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        showProView.toggle()
                    }, label: {
                        Text("Get Items Pro")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.green)
                    })
                    .padding(.horizontal)
                    .accentColor(.primary)
            }
            .sheet(isPresented: $showProView, content: {
                NavigationView {
                    ProView()
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                }
            })
            .navigationTitle("Data")
        }
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UsageView()
                .preferredColorScheme(.dark)
        }
    }
}
