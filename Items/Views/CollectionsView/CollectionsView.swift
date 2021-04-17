//
//  CollectionsView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct CollectionsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let customCollections: [String] = []
    let suggestedCollections = ["Tech", "Clothes", "Home"]
    
    @State var selectedTab = 0
    
    @State var showSheet: Bool = false
    
    @State var createCollection: Bool = false
    @State var showProfile: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("Sort your items by collections")
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
            //  TabContainerView(selectedTab: selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("Collections")
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
    
    var customGrid: some View{
        VStack {
            HStack {
                Text("Custom lists")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            if customCollections.count > 0 {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 500))], content: {
                    ForEach(customCollections, id: \.self) { collection in
                        NavigationLink(
                            destination: ItemsView(),
                            label: {
                                CollectionsItemView(collection: collection)
                            })
                    }
                    .foregroundColor(.primary)
                })
            }
            else {
                HStack {
                    Button(action: {
                        self.showSheet.toggle()
                    }, label: {
                        Text("Add your first collection")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                            .opacity(0.5)
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
                Text("Suggested lists")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 500))], content: {
                ForEach(suggestedCollections, id: \.self) { collection in
                    NavigationLink(
                        destination: ItemsView(),
                        label: {
                            CollectionsItemView(collection: collection)
                        })
                }
                .foregroundColor(.primary)
            })
        }
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
