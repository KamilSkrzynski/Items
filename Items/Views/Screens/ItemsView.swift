//
//  ItemsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ItemsView: View {
    
    @StateObject private var viewModel = ItemsViewModel()
    
    @ObservedObject private var itemsArray = ItemsArray(collection: "Clothes")
    @State var collection: String
    @State var search = ""
    
    var body: some View {
        HStack {
            TextField("Search item", text: $search)
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .padding(.horizontal)
        if itemsArray.itemsArray.count > 0 {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [.init(.flexible(), spacing: 20), .init(.flexible())], spacing: 20, content: {
                        ForEach((itemsArray.itemsArray)
                                    .filter({ "\($0)".contains(search) || search.isEmpty}), id: \.self) { item in
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
                Text("Collection is empty!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.appColor)
                    .padding(.bottom)
                Text("Add first item to this collection")
            }
        }
        Spacer()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var collection = "Clothes"
    static var previews: some View {
        NavigationView {
            ItemsView(collection: collection)
        }
    }
}
