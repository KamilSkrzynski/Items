//
//  BoughtItemsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 27/05/2021.
//

import SwiftUI

struct BoughtItemsView: View {
    
    @StateObject private var viewModel = ItemsViewModel()
    
 //   @ObservedObject private var itemsArray = ItemsArray(collection: "Clothes")
    
    @ObservedObject private var itemsArray = ItemsArray(isBought: true)
    
    @State var search = ""
    
    var body: some View {
        HStack {
            TextField("Search item", text: $search)
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.grayColor)
        
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
