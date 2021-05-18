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
    
    func downloadCollections(userID: String, isSuggested: Bool, handler: @escaping(_ suggestedCollections: [SuggestedCollection]) -> ()) {
        
        REF_COLLECTIONS.whereField("user_id", isEqualTo: userID).whereField("is_suggested", isEqualTo: isSuggested).getDocuments { querySnapshot, error in
            
            handler(self.getCollectionsFromSnapshot(querySnapshot: querySnapshot))
            print("\(userID)")
        }
    }
    
    private func getCollectionsFromSnapshot(querySnapshot: QuerySnapshot?) -> [SuggestedCollection] {
        var suggestedCollections = [SuggestedCollection]()
        
        
        if let snapshot = querySnapshot, snapshot.documents.count > 0 {
   //        var image: UIImage = UIImage()
            
            for document in snapshot.documents {
                if let userID = document.get("user_id") as? String,
                   let collectionID = document.get("collection_id") as? String,
                   let title = document.get("title") as? String,
                   let subtitle = document.get("subtitle") as? String,
                   let isSuggested = document.get("is_suggested") as? Bool
                   
                   {
                    print("Getting collection \(collectionID) from Firebase")
                    let suggestedCollection = SuggestedCollection(collectionID: collectionID, userID: userID, title: title, subtitle: subtitle, isSuggested: isSuggested)
                    
                    print("Adding collection \(collectionID) to suggested collections array")
                    suggestedCollections.append(suggestedCollection)
                 //   print("\(suggestedCollections)")
                }
            }
            return suggestedCollections
        }
        else {
            return suggestedCollections
        }
    }
}
