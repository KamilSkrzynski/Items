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
    
    @State var activeSheet: ProfileViewButton.Sheets?
    
    var profileOptions: some View {
        List(viewModel.itemViewModels.indices, id: \.self) { index in
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
                .offset(x: 5)
                .accentColor(.primary)
        //        .frame(height: 60)
            //    .background(Color.grayColor)
                .padding(.vertical, 5)
            })
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    var body: some View {
        VStack {
            
            profileOptions

            Spacer()
            
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .create:
                NavigationView {
                    AccountView(viewModel: .init(mode: .signup, isPushed: $viewModel.createPushed))
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                }
            case .pro:
                NavigationView {
                    ProView()
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                }
            case .privacy:
                NavigationView {
                    TermsPrivacyView()
                        .preferredColorScheme(isDarkMode ? .dark : .light)
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
