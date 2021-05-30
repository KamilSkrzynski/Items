//
//  BoughtItemsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 27/05/2021.
//

import SwiftUI

struct BoughtItemsView: View {
    
    @StateObject private var viewModel = ItemsViewModel()
    
    @AppStorage("userID") private var userID = ""
    @State var search = ""
    @State private var isSearchShow = false

    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                withAnimation {
                isSearchShow = true
                }
            }, label: {
                Image(systemName: "magnifyingglass")
            })
            if isSearchShow {
            TextField("Search item", text: $search)
            Spacer()
                Button(action: {
                    withAnimation {
                    isSearchShow = false
                    }
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        }
        .onAppear() {
            viewModel.fetchBoughtItems(userID: userID)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 20)
        .padding()
        .background(isSearchShow ? Color.grayColor : Color.clear)
        
        if viewModel.boughtItems.count > 0 {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [.init(.flexible(), spacing: 20), .init(.flexible())], spacing: 20, content: {
                        ForEach((viewModel.boughtItems)
                                    .filter({ "\($0)".contains(search) || search.isEmpty}), id: \.self) { item in
                            SingleItemView(item: item)
                        }
                    })
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Bought")
            .accentColor(.primary)
        }
        else {
            Spacer()
            VStack {
                Text("Collection is empty!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.appColor)
                    .padding(.bottom)
                Text("You haven't tag any item as bought!")
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Bought")
            .accentColor(.primary)
        }
        Spacer()
    }
}

struct BoughtItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BoughtItemsView()
        }
    }
}
