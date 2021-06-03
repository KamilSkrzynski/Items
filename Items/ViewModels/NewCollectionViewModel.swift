//
//  NewCollectionViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 03/05/2021.
//

import Foundation

final class NewCollectionViewModel: ObservableObject {
 
    @Published var collectionTitle = ""
    @Published var collectionSubtitle = ""
    
    let title = "New Collection"
    let subtitle = "Create new collection for your items"
    
    let collectionTitleImageName = "scribble.variable"
    let collectionSubtitleImageName = "shippingbox.fill"
    
    let titlePlaceholder = "title"
    let subtitlePlaceholder = "subtitle"
    
    let imagePlaceholderImageName = "photo.fill"
    
    let buttonTitle = "Create"
    let buttonImageName = "plus.square.fill"
    
    let closeButtonImageName = "xmark"
    
    let alertTitle = "Added!"
    let alertMessage = "Collection successfully created"
    let alertButtonText = "OK"
    
    
    func check() -> Bool {
        if !collectionTitle.isEmpty, !collectionSubtitle.isEmpty {
            return true
        }
        else {
            return false
        }
    }
}
