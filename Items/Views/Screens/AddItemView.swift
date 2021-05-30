//
//  AddItemView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct AddItemView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("userID") private var userID = ""
    
    @StateObject private var viewModel = AddItemViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.subtitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                HStack {
                    Button(action: {
                        viewModel.showImagePicker.toggle()
                    }, label: {
                        Image(uiImage: viewModel.imageSelected)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .scaledToFill()
                    })
                    
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack { //scribble.variable
                            Image(systemName: viewModel.nameImageName)
                            TextField(viewModel.namePlaceholer, text: $viewModel.name)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        HStack {
                            Image(systemName: viewModel.tagImageName)
                                .font(.system(size: 15))
                            TextField(viewModel.tagPlaceholer, text: $viewModel.tag)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        
                        HStack {
                            Image(systemName: viewModel.collectionImageName)
                            Menu  {
                                ForEach(viewModel.collectionNames, id: \.self) { coll in
                                    Button(action: {
                                        viewModel.collection = coll
                                    }, label: {
                                        Text("\(coll)")
                                    })
                                }
                            } label: {
                                
                                Text("\(viewModel.collection)")
                                Spacer()
                            }.accentColor(viewModel.collection != viewModel.collectionPlaceholder ? .primary : Color(.systemGray3))
                        }
                    }
                    .padding()
                }
                .padding()
                .frame(height: 200)
                .background(Color.grayColor)
            }
            
            Button(action: {
                DataService.instance.createItem(userID: userID, collection: viewModel.collection, name: viewModel.name, tag: viewModel.tag, isBought: false, dateCreated: Date(), image: viewModel.imageSelected)
                viewModel.showAlert.toggle()
            }, label: {
                HStack {
                    Image(systemName: viewModel.buttonImageName)
                        .font(.system(size: 30))
                        .foregroundColor(.clear)
                    Spacer()
                    Text(viewModel.buttonTitle)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: viewModel.buttonImageName)
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
            .opacity(viewModel.check() ? 1.0 : 0.3)
            
            Spacer()
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(viewModel.alertButtonText)) {
                self.presentationMode.wrappedValue.dismiss()
            })
        })
        .sheet(isPresented: $viewModel.showImagePicker, content: {
            ImagePicker(imageSelected: $viewModel.imageSelected, isEdit: true).preferredColorScheme(isDarkMode ? .dark : .light)
        })
        .padding()
        .navigationTitle(viewModel.title)
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: viewModel.closeButtonImageName)
                                        .foregroundColor(.primary)
                                }))
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
