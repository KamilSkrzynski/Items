//
//  ProgressCircleViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 03/06/2021.
//

import Foundation

final class ProgressCircleViewModel: ObservableObject {
    
    private var REF_ITEMS = db.collection("items")
    @Published var items = [Item]()
    
    private var REF_COLLECTIONS = db.collection("collections")
    @Published var collections = [Collection]()
    
    func fetchItems(userID: String) {
        REF_ITEMS.whereField("user_id", isEqualTo: userID).addSnapshotListener { querySnapshot, error in
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
                let amount = data["amount"] as? String ?? "1"
                let price = data["price"] as? String ?? "$0.00"
                
                return Item(itemID: itemID, userID: userID, name: name, tag: tag, isBought: isBought, collection: collection, amount: amount, price: price)
            }
            print(self.items.count)
        }
    }
    
    func fetchCollections(userID: String) {
        REF_COLLECTIONS.whereField("user_id", isEqualTo: userID).whereField("is_suggested", isEqualTo: false).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No collections")
                return
            }
            
            self.collections = documents.map { queryDocumentSnapshot -> Collection in
                let data = queryDocumentSnapshot.data()
                
                let userID = data["user_id"] as? String ?? ""
                   let collectionID = data["collection_id"] as? String ?? ""
                   let title = data["title"] as? String ?? ""
                   let subtitle = data["subtitle"] as? String ?? ""
                   let isSuggested = data["is_suggested"] as? Bool ?? false
                
                return Collection(collectionID: collectionID, userID: userID, title: title, subtitle: subtitle, isSuggested: isSuggested)
            }
            print(self.collections.count)
        }
    }
}
