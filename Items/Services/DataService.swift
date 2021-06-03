//
//  DataService.swift
//  Items
//
//  Created by Kamil Skrzyński on 02/05/2021.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

final class DataService {
    
    static let instance = DataService()
    
    let currentUser = Auth.auth().currentUser
    
    private var REF_COLLECTIONS = db.collection("collections")
    private var REF_ITEMS = db.collection("items")
    
    func createItem(userID: String, collection: String, name: String, tag: String, price: String, amount: String, isBought: Bool, dateCreated: Date, image: UIImage) {
        
        let document = REF_ITEMS.document()
        let itemID = document.documentID
        ImageManager.instance.uploadItemImage(userID: userID, itemID: itemID, image: image)
        
        REF_ITEMS.document("\(itemID)").setData([
            "user_id": userID,
            "item_id": itemID,
            "collection": collection,
            "name": name,
            "tag": tag,
            "price": price,
            "amount": amount,
            "is_bought": isBought,
            "date_created": dateCreated
        ])
        
    }
    
    func createCollection(userID: String, title: String, subtitle: String, dateCreated: Date, image: UIImage, isSuggested: Bool) {
        
        let document = REF_COLLECTIONS.document()
        let collectionID = document.documentID
        ImageManager.instance.uploadCollectionImage(userID: userID, collectionID: collectionID, image: image)
        
        REF_COLLECTIONS.document("\(collectionID)").setData([
            "user_id": userID,
            "collection_id": collectionID,
            "title": title,
            "subtitle": subtitle,
            "is_suggested": isSuggested,
            "date_created": dateCreated
        ])
    }
    
    func downloadCollections(userID: String, isSuggested: Bool, handler: @escaping(_ suggestedCollections: [Collection]) -> ()) {
        
        REF_COLLECTIONS.whereField("user_id", isEqualTo: userID).whereField("is_suggested", isEqualTo: isSuggested).getDocuments { querySnapshot, error in
            
            
            handler(self.getCollectionsFromSnapshot(querySnapshot: querySnapshot))
            print("Getting collections for user: \(userID)")
        }
    }
    
    func updateItem(itemID: String) {
        REF_ITEMS.document("\(itemID)").updateData([
            "is_bought": true,
        ]) {
            error in
            if let error = error {
                print("Error updating item \(itemID): \(error)")
            }
            else {
                print("Item \(itemID) successfully updated")
            }
        }
    }
    
    func updateDetailItem(itemID: String, amount: String, price: String, tag: String) {
        REF_ITEMS.document("\(itemID)").updateData([
            "amount": amount,
            "price": price,
            "tag": tag
        ]) {
            error in
            if let error = error {
                print("Error updating item \(itemID): \(error)")
            }
            else {
                print("Item \(itemID) successfully updated")
            }
        }
    }
    
    func deleteItem(itemID: String) {
        REF_ITEMS.document("\(itemID)").delete() { error in
            if let error = error {
                print("Error removing item: \(error)")
            }
            else {
                print("Item removed!")
            }
        }
    }
    
    func deleteCollection(collectionID: String) {
        REF_COLLECTIONS.document("\(collectionID)").delete() { error in
            if let error = error {
                print("Error removing collection: \(error)")
            }
            else {
   //             REF_ITEMS.whereField("collection_id", isEqualTo: collectionID)
                print("Collection removed!")
            }
        }
    }
    
    func downloadCollectionNames(userID: String, handler: @escaping(_ suggestedCollections: [String]) -> ()) {
        REF_COLLECTIONS.whereField("user_id", isEqualTo: userID).getDocuments { querySnapshot, error in
            
            handler(self.getCollectionNameFromSnapshot(querySnapshot: querySnapshot))
            print("Getting collection names for user: \(userID)")
        }
    }
    
    // MARK: Private functions
    private func getCollectionNameFromSnapshot(querySnapshot: QuerySnapshot?) -> [String] {
        var collectionNames = [String]()
        
        if let snapshot = querySnapshot, snapshot.documents.count > 0 {
            for document in snapshot.documents {
                if let collectionTitle = document.get("title") as? String {
                    let collectionName = collectionTitle
                    collectionNames.append(collectionName)
                }
            }
            return collectionNames
        }
        else {
            return collectionNames
        }
    }
    
    private func getCollectionsFromSnapshot(querySnapshot: QuerySnapshot?) -> [Collection] {
        var collections = [Collection]()
        
        if let snapshot = querySnapshot, snapshot.documents.count > 0 {
            
            for document in snapshot.documents {
                if let userID = document.get("user_id") as? String,
                   let collectionID = document.get("collection_id") as? String,
                   let title = document.get("title") as? String,
                   let subtitle = document.get("subtitle") as? String,
                   let isSuggested = document.get("is_suggested") as? Bool
                   
                   {
                    print("Getting collection \(collectionID) from Firebase")
                    let collection = Collection(collectionID: collectionID, userID: userID, title: title, subtitle: subtitle, isSuggested: isSuggested)
                    
                    print("Adding collection \(collectionID) to \(isSuggested ? "suggested" : "custom") collections array")
                    collections.append(collection)
                }
            }
            return collections
        }
        else {
            return collections
        }
    }
}
