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
            HStack {
                Text(viewModel.subtitle)
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                    viewModel.onAppear()
                }
            ForEach(viewModel.itemViewModels.indices, id: \.self) { index in
                Button(action: {
                    viewModel.tappedItem(at: index)
                }, label: {
                    HStack {
                        Image(systemName: viewModel.itemViewModels[index].image)
                            .foregroundColor(.secondaryColor)
                            .font(.system(size: 25))
                        Text(viewModel.itemViewModels[index].name)
                        Spacer()
                    }
                    .offset(x: 10)
                    .accentColor(.primary)
                    
                })
                .frame(height: 60)
                .background(Color.grayColor)
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
        }
    }
    
    var body: some View {
        VStack {
            
            profileOptions
                .background(NavigationLink(
                                destination: AccountView(viewModel: .init(mode: .signup, isPushed: $viewModel.loginSignupPushed)),
                                isActive: $viewModel.loginSignupPushed,
                                label: {
                                }))
            Spacer()
            
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
