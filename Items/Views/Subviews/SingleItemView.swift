//
//  SingleItemView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct SingleItemView: View {
    
    @State var item: Item
    @State var itemImage: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.grayColor)
                
                VStack {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "trash")
                            .font(.system(size: 15))
                            .foregroundColor(.secondaryColor)
                    })
                    .offset(x: 60, y: 5)
                    
                    Spacer()
                    
                    Divider()
                        .padding()
                    
                    Image("\(itemImage)")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .scaledToFill()
                        .offset(y: -5)
                }
            }
            .frame(width: 150, height: 200)
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("#\(item.tag)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .offset(x: -5, y: 10)
            .padding(.horizontal, 5)
        }
        .padding()
    }
}

struct SingleItemView_Previews: PreviewProvider {
    static let item = Item(userID: "", name: "T-shirt", tag: "tops", collection: "")
    static var previews: some View {
        SingleItemView(item: item, itemImage: 0)
            .preferredColorScheme(.dark)
    }
}
