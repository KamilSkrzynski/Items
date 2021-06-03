//
//  CollectionsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct CollectionsView: View {
    
    @ObservedObject private var viewModel = CollectionsViewModel()
    
    @AppStorage("userID") private var userID = ""
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State var showSheet: Bool = false
    @State var search = ""
    @State private var isSearchShow = false
    let item = Item(itemID: "", userID: "", name: "", tag: "", isBought: false, collection: "", amount: "", price: "")
    
    @State var createCollection: Bool = false
    
    var customGrid: some View{
        VStack {
            HStack {
                Text(viewModel.customListTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .onAppear() {
                viewModel.fetchCustomCollections(userID: self.userID)
                viewModel.fetchSuggestedCollections(userID: self.userID)
            }
            .padding()
            
            if viewModel.customCollections.count > 0 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.customCollections
                                    .filter({ "\($0)".contains(search) || search.isEmpty}), id: \.self) { collection in
                            NavigationLink(
                                destination: ItemsView(collection: collection.title),
                                label: {
                                    SingleCollectionView(collection: collection)
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
                    ForEach(viewModel.suggestedCollections.filter({ "\($0)".contains(search) || search.isEmpty}), id: \.self) { collection in
                        NavigationLink(
                            destination: ItemsView(collection: collection.title),
                            label: {
                                SingleCollectionView(collection: collection)
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
        if viewModel.isLoading {
            ProgressView()
        }
        else {
            VStack {
                HStack {
                    if !isSearchShow {
                        Text(viewModel.subtitle)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isSearchShow = true
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                    })
                    if isSearchShow {
                        TextField("Search item", text: $search)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isSearchShow = false
                                search = ""
                            }
                        }, label: {
                            Image(systemName: "xmark")
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 20)
                .padding()
                .background(isSearchShow ? Color.grayColor : Color.clear)
                ScrollView(showsIndicators: false) {
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
                NavigationView {
                    NewCollectionView()
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                        .background(isDarkMode == true ? Color.black.ignoresSafeArea()  : Color.white.ignoresSafeArea() )           }
            }
            .accentColor(.primary)
            //        .sheet(isPresented: $showSheet, content: {
            //            NavigationView {
            //                ProView()
            //            }
            //        })
            //        .accentColor(.primary)
        }
    }
}

struct CollectionsView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            CollectionsView()
                .preferredColorScheme(.dark)
        }
        .preferredColorScheme(.light)
    }
}
