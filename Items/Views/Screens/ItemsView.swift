//
//  ItemsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ItemsView: View {
    
    @ObservedObject private var viewModel = ItemsViewModel()
    @AppStorage("userID") private var userID = ""
    
    @State var collection: String
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                withAnimation {
                    viewModel.isSearchShow = true
                }
            }, label: {
                Image(systemName: viewModel.searchImageName)
            })
            if viewModel.isSearchShow {
                TextField(viewModel.searchPlaceholderText, text: $viewModel.search)
                Spacer()
                Button(action: {
                    withAnimation {
                        viewModel.isSearchShow = false
                        viewModel.search = ""
                    }
                }, label: {
                    Image(systemName: viewModel.closeSearchImageName)
                })
            }
        }
        .onAppear() {
            viewModel.fetchItems(userID: userID, collection: collection)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 20)
        .padding()
        .background(viewModel.isSearchShow ? Color.grayColor : Color.clear)
        
        if viewModel.items.count > 0 {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [.init(.flexible(), spacing: 20), .init(.flexible())], spacing: 20, content: {
                        ForEach((viewModel.items)
                                    .filter({ "\($0)".contains(viewModel.search) || viewModel.search.isEmpty}), id: \.self) { item in
                            SingleItemView(item: item)
                        }
                    })
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("\(collection)")
            .accentColor(.primary)
        }
        else {
            Spacer()
            VStack {
                Text(viewModel.emptyCollectionTitleText)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.appColor)
                    .padding(.bottom)
                Text(viewModel.emptyCollectionSubtitleText)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("\(collection)")
            .accentColor(.primary)
        }
        Spacer()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemsView(collection: "Clothes")
        }
    }
}
