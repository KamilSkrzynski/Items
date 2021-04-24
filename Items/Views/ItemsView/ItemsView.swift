//
//  ItemsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ItemsView: View {
    
    var number = [0, 1, 2, 3, 4, 5, 6, 7]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [.init(.flexible(), spacing: 20), .init(.flexible())], spacing: 20, content: {
                    ForEach(number, id: \.self) { item in
                        SingleItemView(item: item)
                    }
                })
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("Items")
        .accentColor(.primary)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemsView()
        }
    }
}
