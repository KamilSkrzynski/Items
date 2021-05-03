//
//  AddItemViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 03/05/2021.
//

import Foundation

final class AddItemViewModel: ObservableObject {
    
    let title = "New Item"
    let subtitle = "Create new item you want to track"
    
    let buttonTitle = "Create"
    let buttonImageName = "plus.square.fill"
    
    let namePlaceholer = "name"
    let storePlaceholer = "store"
    let tagPlaceholer = "tag"
    
    let imagePlaceholderImageName = "photo.fill"
    
    let nameImageName = "scribble.variable"
    let storeImageName = "shippingbox.fill"
    let tagImageName = "tag.fill"
    let collectionImageName = "doc.fill"
    let closeButtonImageName = "xmark"
    
    @Published var name = ""
    @Published var store = ""
    @Published var tag = ""
    @Published var collection = "collection"
    
    
    func check() -> Bool {
        if !name.isEmpty, !store.isEmpty, !tag.isEmpty, !collection.isEmpty {
            return true
        }
        else {
            return false
        }
    }
}
