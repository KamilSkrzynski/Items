//
//  DataService.swift
//  Items
//
//  Created by Kamil Skrzyński on 02/05/2021.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class DataService {
    
    static let instance = DataService()
    
    let currentUser = Auth.auth().currentUser
    
    private var collections = db.collection("colletions")
    private var items = db.collection("items")
    
    func createCollection(userID: String, collectionID: String, title: String, subtitle: String, dateCreated: Date, image: UIImage) {
        
        ImageManager.instance.uploadCollectionImage(userID: userID, collectionID: collectionID, image: image)
        
        collections.document("\(collectionID)").setData([
            "user_id": userID,
            "collection_id": collectionID,
            "title": title,
            "subtitle": subtitle,
            "date_created": dateCreated
        ])
    }
}
