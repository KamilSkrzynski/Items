//
//  SingleItemView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct SingleItemView: View {
    
    @AppStorage("userID") private var userID = ""
    
    @State var item: Item
    @State var image: UIImage = UIImage(named: "Placeholder")!
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.grayColor)
                
                VStack {
                    HStack {
                        Spacer()
                        if item.isBought == false {
                        Button(action: {
                            DataService.instance.updateItem(itemID: item.itemID)
                        }, label: {
                            Image(systemName: "checkmark.square")
                                .font(.system(size: 18))
                                .foregroundColor(.secondaryColor)
                        })
                        }
                        
                        Button(action: {
                            DataService.instance.deleteItem(itemID: item.itemID)
                        }, label: {
                            Image(systemName: "trash")
                                .font(.system(size: 15))
                                .foregroundColor(.secondaryColor)
                        })
                    }
                    .padding(5)
                    
                    
                    Spacer()
                    
                    Divider()
                        .padding()
                    
                    Image(uiImage: image)
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
                
                if item.isBought == true {
                    Text("#\(item.collection)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                Text("#\(item.tag)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            .offset(x: -5, y: 10)
            .padding(.horizontal, 5)
        }.onAppear {
            getImage()
        }
        .padding()
    }
    
    func getImage() {
        ImageManager.instance.downloadItemImage(userID: item.userID, itemID: item.itemID) { returnedImage in
            if let image = returnedImage {
                self.image = image
            }
        }
    }
}

struct SingleItemView_Previews: PreviewProvider {
    static let item = Item(itemID: "", userID: "", name: "T-shirt", tag: "tops", isBought: false, collection: "")
    static var previews: some View {
        SingleItemView(item: item)
            .preferredColorScheme(.dark)
    }
}
