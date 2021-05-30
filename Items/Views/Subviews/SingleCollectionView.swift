//
//  SingleCollectionView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct SingleCollectionView: View {
    
    @State var collection: Collection
    @AppStorage("userID") private var userID = ""
    
    @State var image: UIImage = UIImage(named: "Placeholder")!
    @State private var showDeleteAlert = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFill()
                
                Divider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                            HStack {
                                Text(collection.title)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                                if collection.isSuggested == false {
                                    Button(action: {
                                        showDeleteAlert.toggle()
                                    }, label: {
                                        Image(systemName: "trash")
                                            .font(.system(size: 15))
                                            .foregroundColor(.secondaryColor)
                                    })
                                }
                            }.padding(.vertical, 7)
                            
                    HStack {
                        Text(collection.subtitle)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        Spacer().frame(width: proxy.size.width*0.08)
                    }
                        }
                .frame(height: 90)
                        .padding(.horizontal)
            }
            .frame(width: 180, height: 300)
            .background(Color.grayColor)
        }
        .alert(isPresented: $showDeleteAlert, content: {
            Alert(title: Text("Delete Collection"), message: Text("Are you sure you want to delete this collection?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete").fontWeight(.bold)) {
                DataService.instance.deleteCollection(collectionID: collection.collectionID)
            })
        })
        
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
    static var collection = Collection(collectionID: "", userID: "", title: "Home", subtitle: "Fragnances needed", isSuggested: false)
    
    static var previews: some View {
        SingleCollectionView(collection: collection)
            .preferredColorScheme(.dark)
    }
}
