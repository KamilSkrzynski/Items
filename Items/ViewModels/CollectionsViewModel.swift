//
//  CollectionsViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import Foundation

final class CollectionsViewModel: ObservableObject {
 
    let title = "Collections"
    let subtitle = "Sort your items by collections"
    let customListTitle = "Custom lists"
    let suggestedListTitle = "Suggested lists"
    let emptyCustomListButtonTitle = "Add your first collection"
    let anyCustomListButtonTitle = "Add collection"
    
    let suggestedCollections = [
        SingleCollectionViewModel(title: "Clothes", subtitle: "Expand your wardrobe", imageName: "Clothes"),
        SingleCollectionViewModel(title: "Tech", subtitle: "Save your tech essentials", imageName: "Tech"),
        SingleCollectionViewModel(title: "Home", subtitle: "Elevate your home's design", imageName: "Home")
    ]
}
