//
//  CollectionsViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import Foundation
import SwiftUI

final class CollectionsViewModel: ObservableObject {
    
    @AppStorage("userID") private var userID = ""
    
    let title = "Collections"
    let subtitle = "Sort your items by collections"
    let customListTitle = "Custom lists"
    let suggestedListTitle = "Suggested lists"
    let emptyCustomListButtonTitle = "Add your first collection here"
    let anyCustomListButtonTitle = "Add collection here"
    
    @Published var suggestedCollections = CollectionsArray(isSuggested: true)
    
//    let suggestedCollectionImages = [UIImage(named: "Clothes"), UIImage(named: "Tech"), UIImage(named: "Home")]
    
    @Published var customCollections = CollectionsArray(isSuggested: false)
}

extension CollectionsViewModel {
    enum Sheets: Identifiable {
        case createCollection
        case pro
        
        var id: Int {
            hashValue
        }
    }
}
