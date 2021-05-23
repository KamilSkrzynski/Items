//
//  CustomCollectionsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 16/05/2021.
//

import SwiftUI

struct CustomCollectionsView: View {
    @StateObject private var viewModel = CollectionsViewModel()
    
    @State var createCollection: Bool = false
    
    var collections: CollectionsArray
    
    var body: some View{
        VStack {
            HStack {
                Text(viewModel.customListTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            if viewModel.customCollections.collectionArray.count > 0 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(collections.collectionArray, id: \.self) { collection in
                        NavigationLink(
                            destination: ItemsView(collection: collection.title),
                            label: {
                                EmptyView()
                                    .padding(.bottom, 280)
                                    .padding(.trailing, 190)
                            })
                    }
                    .foregroundColor(.primary)
                       
                        HStack {
                            Button(action: {
                                self.createCollection.toggle()
                            }, label: {
                                        Text(viewModel.anyCustomListButtonTitle)
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.secondary)
                            })
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            else {
                HStack {
                    Button(action: {
                        self.createCollection.toggle()
                    }, label: {
                                Text(viewModel.emptyCustomListButtonTitle)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                    })
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CustomCollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCollectionsView(collections: CollectionsArray(isSuggested: true))
    }
}
