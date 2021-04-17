//
//  AddItemView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var name = ""
    @State var store = ""
    @State var price = ""
    @State var collection = "collection"
    
    @State private var showCollections = false

    
    var collections = ["tech", "clothes", "home"]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Create new item you want to track")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 140, height: 140)
                                    .foregroundColor(.mainColor)
                                
                                Image(systemName: "photo.fill")
                                    .foregroundColor(.secondaryColor)
                                    .font(.system(size: 60))
                            }
                        })
                        
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            HStack { //scribble.variable
                                Image(systemName: "scribble.variable")
                                TextField("name", text: $name)
                            }
                            HStack {
                                Image(systemName: "shippingbox.fill")
                                TextField("store", text: $store)
                            }
                            HStack {
                                Image(systemName: "dollarsign.square.fill")
                                TextField("price", text: $price)
                            }
                            
                            HStack {
                                Image(systemName: "tag.fill")
                                    .font(.system(size: 15))
                                Menu  {
                                    ForEach(collections, id: \.self) { coll in
                                        Button(action: {
                                            self.collection = coll
                                        }, label: {
                                            Text("\(coll)")
                                        })
                                                                    }
                                } label: {
                                    
                                    Text("\(collection)")
                                    Spacer()
                                }     .accentColor(collection != "collection" ? .primary : Color(.systemGray3))

                                
//                                Image(systemName: "tag.fill")
//                                    .font(.system(size: 15))
//
//                                Button(action: {
//                                    self.showCollections = true
//                                }, label: {
//                                    Text("\(collection)")
//                                })
//                                .contextMenu(menuItems: {
//                                    ForEach(collections, id: \.self) { coll in
//                                        Text("\(coll)")
//                                    }
//                                })
//                                .accentColor(showCollections ? .primary : Color(.systemGray3))
//                                Spacer()
                            }
                        }
                        .padding()
                    }
                    .padding()
                    .frame(height: 200)
                    .background(Color.grayColor)
                }
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.secondaryColor)
                                .offset(x: 10)
                            
                            Image(systemName: "plus.square.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.mainColor)
                                .offset(x: 10)
                        }
                        Spacer()
                            .frame(width: proxy.size.width*0.27)
                        Text("Create")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(height: 60)
                        Spacer()
                        
                    }
                    .opacity(check() ? 1.0 : 0.3)
                })
                .frame(maxWidth: .infinity)
                .background(Color.grayColor)
                .accentColor(.primary)
                .padding(.vertical)
                Spacer()
            }
            .padding()
            .navigationTitle("New Item")
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.primary)
                                    }))
        }
    }
    
    func check() -> Bool {
        if !name.isEmpty, !store.isEmpty, !price.isEmpty, !collection.isEmpty {
            return true
        }
        else {
            return false
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItemView()
                .preferredColorScheme(.dark)
        }
    }
}
