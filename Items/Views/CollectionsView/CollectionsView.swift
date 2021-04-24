//
//  CollectionsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct CollectionsView: View {
    
    @StateObject private var viewModel = CollectionsViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    
    let customCollections: [String] = []
    
    @State var showSheet: Bool = false
    
    @State var createCollection: Bool = false
    @State var showProfile: Bool = false
    
    var customGrid: some View{
        VStack {
            HStack {
                Text(viewModel.customListTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            HStack {
                Button(action: {
                    self.showSheet.toggle()
                }, label: {
                            Text(customCollections.count > 0 ? viewModel.anyCustomListButtonTitle : viewModel.emptyCustomListButtonTitle)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                })
                
                Spacer()
            }
            .padding(.horizontal)
            
            if customCollections.count > 0 {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 500))], content: {
                    ForEach(viewModel.suggestedCollections, id: \.self) { collection in
                        NavigationLink(
                            destination: ItemsView(),
                            label: {
                                                    SingleCollectionView(viewModel: collection)
                            })
                    }
                    .foregroundColor(.primary)
                })
            }
        }
    }
    
    var suggestedGrid: some View {
        VStack {
            HStack {
                Text(viewModel.suggestedListTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 300))], content: {
                ForEach(viewModel.suggestedCollections, id: \.self) { collection in
                    NavigationLink(
                        destination: ItemsView(),
                        label: {
                            SingleCollectionView(viewModel: collection)
                                .padding(.bottom, 280)
                                .padding(.trailing, 190)
                        })
                }
                .foregroundColor(.primary)
            })
            }
        }
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                HStack {
                    Text(viewModel.subtitle)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
                customGrid
                
                Divider()
                    .frame(height: 5)
                    .padding(.horizontal)
                
                suggestedGrid
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle(viewModel.title)
        .sheet(isPresented: $createCollection) {
            NewCollectionView()
        }
        .sheet(isPresented: $showSheet, content: {
            NavigationView {
                ProView()
            }
        })
        .accentColor(.primary)
    }
}

struct CollectionsView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            CollectionsView()
                .preferredColorScheme(.dark)
        }
    }
}
