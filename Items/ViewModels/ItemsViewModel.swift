//
//  ItemsViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 23/05/2021.
//

import Foundation
import SwiftUI

final class ItemsViewModel: ObservableObject {
    
    private var REF_ITEMS = db.collection("items")
    @Published var items = [Item]()
    @Published var boughtItems = [Item]()
    
    @State var search = ""
    @State var isSearchShow = false
    
    let searchImageName = "magnifyingglass"
    let searchPlaceholderText = "Search item"
    let closeSearchImageName = "xmark"
    
    let emptyCollectionTitleText = "Collection is empty!"
    let emptyCollectionSubtitleText = "Add first item to this collection"
    
    func fetchItems(userID: String, collection: String) {
        REF_ITEMS.whereField("user_id", isEqualTo: userID).whereField("collection", isEqualTo: collection).whereField("is_bought", isEqualTo: false).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No items")
                return
            }
            
            self.items = documents.map { queryDocumentSnapshot -> Item in
                let data = queryDocumentSnapshot.data()
                
                let userID = data["user_id"] as? String ?? ""
                   let itemID = data["item_id"] as? String ?? ""
                   let collection = data["collection"] as? String ?? ""
                   let name = data["name"] as? String ?? ""
                   let isBought = data["is_bought"] as? Bool ?? false
                   let tag = data["tag"] as? String ?? ""
                
                return Item(itemID: itemID, userID: userID, name: name, tag: tag, isBought: isBought, collection: collection)
            }
        }
    }
    
    func fetchBoughtItems(userID: String) {
        REF_ITEMS.whereField("user_id", isEqualTo: userID).whereField("is_bought", isEqualTo: true).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No items")
                return
            }
            
            self.boughtItems = documents.map { queryDocumentSnapshot -> Item in
                let data = queryDocumentSnapshot.data()
                
                let userID = data["user_id"] as? String ?? ""
                   let itemID = data["item_id"] as? String ?? ""
                   let collection = data["collection"] as? String ?? ""
                   let name = data["name"] as? String ?? ""
                   let isBought = data["is_bought"] as? Bool ?? false
                   let tag = data["tag"] as? String ?? ""
                
                return Item(itemID: itemID, userID: userID, name: name, tag: tag, isBought: isBought, collection: collection)
            }
        }
    }

}
