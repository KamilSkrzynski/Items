//
//  ItemDetailView.swift
//  Items
//
//  Created by Kamil Skrzyński on 03/06/2021.
//

import SwiftUI

struct ItemDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("userID") private var userID = ""
    
    @State var image: UIImage = UIImage(named: "Placeholder")!
    @State var tag = ""
    @State var amount = ""
    @State var price = ""
    @State var item: Item
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    Text("\(item.name)")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    Text("C: \(item.collection)")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    Text("#\(item.tag)")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.vertical)
            .frame(height: 180)
            .frame(maxWidth: .infinity)
            Divider()
            HStack {
                Text("Edit item information")
                Spacer()
            }
            HStack {
                Text("Tag")
                    .frame(width: 60)
                    .padding()
                    .background(Color.grayColor)
                TextField("\(item.tag)", text: $tag)
                    .padding()
                    .background(Color.grayColor)
            }
            HStack {
                Text("Amount")
                    .frame(width: 60)
                    .padding()
                    .background(Color.grayColor)
                TextField("\(item.amount)", text: $amount)
                    .padding()
                    .background(Color.grayColor)
            }
            HStack {
                Text("Price")
                    .frame(width: 60)
                    .padding()
                    .background(Color.grayColor)
                TextField("$\(item.price)", text: $price)
                    .padding()
                    .background(Color.grayColor)
            }
            Divider()
            Button(action: {
                DataService.instance.updateDetailItem(itemID: item.itemID, amount: amount, price: price, tag: tag)
            }, label: {
                Text("Save changes")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundColor(.white)
                    .background(Color.appColor)
            })
            Spacer()
        }
        .padding()
        .onAppear {
            getImage()
        }
        .accentColor(.primary)
        .navigationTitle("Details")
    }
    
    func getImage() {
        ImageManager.instance.downloadItemImage(userID: item.userID, itemID: item.itemID) { returnedImage in
            if let image = returnedImage {
                self.image = image
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: Item(itemID: "", userID: "", name: "", tag: "", isBought: false, collection: "", amount: "", price: ""))
                .preferredColorScheme(.dark)
        }
    }
}
