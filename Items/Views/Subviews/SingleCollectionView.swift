//
//  SingleCollectionView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct SingleCollectionView: View {
    
    @State var collection: SuggestedCollection
    @AppStorage("userID") private var userID = ""
    
    @State var image: UIImage = UIImage(named: "Placeholder")!
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFill()
                    .padding(.horizontal)
                    .offset(y: -2)
                
                Divider()
                    .padding(.horizontal)
                
                
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(collection.title)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(collection.subtitle)
                                .font(.callout)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                        Spacer()
                    }
                    if collection.isSuggested == false {
                        Button(action: {
                            DataService.instance.deleteCollection(collectionID: collection.collectionID)
                        }, label: {
                            Image(systemName: "trash")
                                .font(.system(size: 15))
                                .foregroundColor(.secondaryColor)
                        })
                        .offset(x: -10, y: -30)
                    }

                }
            }
            .padding()
            .frame(width: 180, height: 310)
            .background(Color.grayColor)
        }
        .onAppear {
            getImage()
        }
        .padding(.leading)
    }
    
    func getImage() {
        ImageManager.instance.downloadCollectionImage(userID: collection.userID, collectionID: collection.collectionID) { returnedImage in
            if let image = returnedImage {
                self.image = image
            }
        }
    }
}

struct SingleCollectionView_Previews: PreviewProvider {
    static var collection = SuggestedCollection(collectionID: "", userID: "", title: "Home", subtitle: "Elevate your flat jasdkajs ahsdjash", isSuggested: false)
    
    static var previews: some View {
        SingleCollectionView(collection: collection)
            .preferredColorScheme(.dark)
    }
}
