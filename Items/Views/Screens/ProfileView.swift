//
//  ProfileView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @StateObject private var viewModel = ProfileViewModel()
    
    @State var activeSheet: ProfileViewButton.ProfileViewButtonType?
    
    var profileOptions: some View {
        
        VStack {
            ForEach(viewModel.itemViewModels.indices, id: \.self) { index in
                Button(action: {
                    viewModel.tappedItem(at: index)
                }, label: {
                        HStack {
                        Image(systemName: viewModel.itemViewModels[index].image)
                            .font(.system(size: 25))
                        Text(viewModel.itemViewModels[index].name)
                        Spacer()
                    }
                    .foregroundColor(viewModel.itemViewModels[index].name == "Logout" ? Color.red : Color.secondaryColor)
                    .offset(x: 10)
                    .accentColor(.primary)
                })
                .frame(height: 60)
                .background(Color.grayColor)
                .padding(.horizontal)
                .padding(.vertical, 5)
                if viewModel.itemViewModels[index].name == "Privacy Policy" {
                    Divider()
                        .padding(.horizontal)
                }
            }
        }
    }
    
    var body: some View {
            VStack {
                HStack {
                    Text(viewModel.subtitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding()
                    .onAppear {
                        viewModel.onAppear()
                    }
                ScrollView {
                profileOptions
                    .alert(isPresented: $viewModel.showLogoutAlert, content: {
                        Alert(title: Text("Logout"), message: Text("Are you sure you want to logout?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Logout").fontWeight(.bold)) {
                            self.viewModel.authService.logout()
                        })
                    })
                    .background(
                        NavigationLink(
                                    destination: AccountView(viewModel: .init(mode: .signup, isPushed: $viewModel.loginSignupPushed)),
                                    isActive: $viewModel.loginSignupPushed,
                                    label: {
                                    }))
                    .background(NavigationLink(
                                    destination: BoughtItemsView(),
                                    isActive: $viewModel.itemsBoughtPushed,
                                    label: {
                                    }))
                    .background(NavigationLink(
                                    destination: TermsPrivacyView(),
                                    isActive: $viewModel.termsPushed,
                                    label: {
                                    }))
                    .background(NavigationLink(
                                    destination: UsageView(),
                                    isActive: $viewModel.usagePushed,
                                    label: {
                                    }))
                Spacer()
                
            }
            .navigationTitle(viewModel.title)
        }
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
