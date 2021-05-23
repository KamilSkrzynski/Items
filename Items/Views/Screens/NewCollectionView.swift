//
//  NewCollectionView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct NewCollectionView: View {
    
    @AppStorage("userID") private var userID = ""
    
    @StateObject private var viewModel = NewCollectionViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showCollections = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.subtitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                HStack {
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.mainColor)
                            
                            Image(systemName: viewModel.imagePlaceholderImageName)
                                .foregroundColor(.secondaryColor)
                                .font(.system(size: 60))
                        }
                    })
                    
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack {                            Image(systemName: viewModel.collectionTitleImageName)
                            TextField(viewModel.titlePlaceholder, text: $viewModel.collectionTitle)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }
                        HStack {
                            Image(systemName: viewModel.collectionSubtitleImageName)
                            TextField(viewModel.subtitlePlaceholder, text: $viewModel.collectionSubtitle)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                        }                    }
                        .padding()
                }
                .padding()
                .frame(height: 200)
                .background(Color.grayColor)
            }
            
            Button(action: {
                DataService.instance.createCollection(userID: userID, title: viewModel.collectionTitle, subtitle: viewModel.collectionSubtitle, dateCreated: Date(), image: UIImage(named: "Placeholder")!, isSuggested: false)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: viewModel.buttonImageName)
                        .font(.system(size: 30))
                        .foregroundColor(.clear)
                    Spacer()
                    Text(viewModel.buttonTitle)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: viewModel.buttonImageName)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                }
                .padding()
                .frame(height: 60)
            })
            .frame(maxWidth: .infinity)
            .background(Color.appColor)
            .accentColor(.primary)
            .padding(.vertical)
            .opacity(viewModel.check() ? 1.0 : 0.3)
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.title)
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: viewModel.closeButtonImageName)
                                        .foregroundColor(.primary)
                                }))
    }
}
struct NewCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NewCollectionView()
    }
}
