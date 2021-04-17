//
//  ProfileView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    @State var activeSheet: ProfileViewButton.Sheets?
    
    var buttons = [
        ProfileViewButton(imageName: "person.crop.circle.fill.badge.plus", title: "Create Account", sheet: .create),
        ProfileViewButton(imageName: "lightbulb.fill", title: "Switch to Dark Mode", sheet: .pro),
        ProfileViewButton(imageName: "shield.lefthalf.fill", title: "Privacy Policy", sheet: .privacy)
    ]
    
    var profileOptions: some View {
        ForEach(buttons, id: \.self) { button in
            Button(action: {
                activeSheet = button.sheet
            }, label: {
                HStack() {
                    ZStack {
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.secondaryColor)
                            .opacity(0.5)
                        Image(systemName: button.imageName)
                            .foregroundColor(.mainColor)
                            .font(.system(size: 35))
                    }
                    .offset(x: 10, y: 10)
                    Text(button.title)
                        .padding()
                    Spacer()
                    Image(systemName: viewModel.chevron)
                        .padding()
                }
                .accentColor(.primary)
                .frame(height: 60)
                .background(Color.grayColor)
                .padding()
            })
        }
    }
    
    var body: some View {
        VStack() {
            
            profileOptions
            
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
            case .privacy:
                NavigationView {
                    TermsPrivacyView()
                }
            }
        }
        .navigationTitle(viewModel.title)
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
