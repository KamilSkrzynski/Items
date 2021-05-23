//
//  ItemsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ItemsView: View {
    
    @ObservedObject private var itemsArray = ItemsArray(collection: "collection")
    
    @State var collection: String
    
    var number = [0, 1, 2, 3, 4, 5, 6, 7]
    
    var body: some View {
        if itemsArray.itemsArray.count > 0 {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [.init(.flexible(), spacing: 20), .init(.flexible())], spacing: 20, content: {
                    ForEach(itemsArray.itemsArray, id: \.self) { item in
                        SingleItemView(item: item, itemImage: 1)
                    }
                })
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("\(collection)")
        .accentColor(.primary)
    }
        else {
            VStack {
            Text("Collection is empty!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.appColor)
                .padding(.bottom)
            Text("Add first item to this collection")
            }
        }
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
