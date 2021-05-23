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
        ImageManager.instance.downloadItemImage(userID: userID, itemID: item.itemID) { returnedImage in
            if let image = returnedImage {
                self.image = image
            }
        }
    }
}

struct SingleItemView_Previews: PreviewProvider {
    static let item = Item(itemID: "", userID: "", name: "T-shirt", tag: "tops", collection: "")
    static var previews: some View {
        SingleItemView(item: item)
            .preferredColorScheme(.dark)
    }
}
