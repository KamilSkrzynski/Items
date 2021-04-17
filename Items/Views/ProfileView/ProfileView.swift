//
//  ProfileView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

enum Sheets: Identifiable {
    case create
    case pro
    
    var id: Int {
        hashValue
    }
}

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    @State var activeSheet: Sheets?
    
    var body: some View {
        VStack() {
            Button(action: {
                activeSheet = .create
            }, label: {
                HStack() {
                    ZStack {
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.secondaryColor)
                            .opacity(0.5)
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .foregroundColor(.mainColor)
                            .font(.system(size: 35))
                    }
                    .offset(x: 10, y: 10)
                    Text("Create Account")
                        .padding()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding()
                }
                .accentColor(.primary)
                .frame(height: 60)
                .background(Color.grayColor)
                .padding()
            })
            Button(action: {
                activeSheet = .pro
            }, label: {
                HStack() {
                    ZStack {
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.secondaryColor)
                            .opacity(0.5)
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.mainColor)
                            .font(.system(size: 35))
                    }
                    .offset(x: 10, y: 10)
                    Text("Switch to Dark Mode")
                        .padding()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding()
                }
                .accentColor(.primary)
                .frame(height: 60)
                .background(Color.grayColor)
                .padding()
            })
            
            HStack() {
                ZStack {
                    Rectangle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.secondaryColor)
                        .opacity(0.5)
                    Image(systemName: "shield.lefthalf.fill")
                        .foregroundColor(.mainColor)
                        .font(.system(size: 35))
                }
                .offset(x: 10, y: 10)
                Text("Privacy Policy")
                    .padding()
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
            }
            .frame(height: 60)
            .background(Color.grayColor)
            .padding()
            
            Spacer()
            
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .create:
                NavigationView {
                    AccountView(viewModel: .init(mode: .signup, isPushed: $viewModel.createPushed))
                }
            case .pro:
                NavigationView {
                    ProView()
                }
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
                .preferredColorScheme(.dark)
        }
    }
}
