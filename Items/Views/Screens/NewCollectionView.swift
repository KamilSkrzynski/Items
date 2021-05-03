//
//  NewCollectionView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct NewCollectionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var title = ""
    @State var subtitle = ""
    @State var tag = ""
    
    @State private var showCollections = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Create new collection for your items")
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
                        HStack {                            Image(systemName: "scribble.variable")
                            TextField("title", text: $title)
                        }
                        HStack {
                            Image(systemName: "shippingbox.fill")
                            TextField("subtitle", text: $subtitle)
                        }                    }
                        .padding()
                }
                .padding()
                .frame(height: 200)
                .background(Color.grayColor)
            }
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: "plus.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.clear)
                    Spacer()
                    Text("Create")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "plus.square.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                }
                .padding()
                .frame(height: 60)
            })
            .frame(maxWidth: .infinity)
            .background(Color.appColor)
            .accentColor(.primary)
            .padding(.vertical)
            .opacity(check() ? 1.0 : 0.3)
            
            Spacer()
        }
        .padding()
        .navigationTitle("New Collection")
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.primary)
                                }))
    }
    
    func check() -> Bool {
        if !title.isEmpty, !subtitle.isEmpty {
            return true
        }
        else {
            return false
        }
    }
}
struct NewCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NewCollectionView()
    }
}
