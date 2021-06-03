//
//  CollectionsViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import Foundation
import SwiftUI

final class CollectionsViewModel: ObservableObject {
    
    private var REF_COLLECTIONS = db.collection("collections")
    @AppStorage("userID") private var userID = ""
    
    @Published var suggestedCollections = [Collection]()
    @Published var customCollections = [Collection]()
    @Published private(set) var isLoading = false
    
    func fetchSuggestedCollections(userID: String) {
        isLoading = true
        REF_COLLECTIONS.whereField("user_id", isEqualTo: userID).whereField("is_suggested", isEqualTo: true).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No collections")
                return
            }
            
            self.suggestedCollections = documents.map { queryDocumentSnapshot -> Collection in
                let data = queryDocumentSnapshot.data()
                
                let userID = data["user_id"] as? String ?? ""
                   let collectionID = data["collection_id"] as? String ?? ""
                   let title = data["title"] as? String ?? ""
                   let subtitle = data["subtitle"] as? String ?? ""
                   let isSuggested = data["is_suggested"] as? Bool ?? false
                
                return Collection(collectionID: collectionID, userID: userID, title: title, subtitle: subtitle, isSuggested: isSuggested)
            }
        }
        isLoading = false
    }
    
    func fetchCustomCollections(userID: String) {
        isLoading = true
        REF_COLLECTIONS.whereField("user_id", isEqualTo: userID).whereField("is_suggested", isEqualTo: false).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No collections")
                return
            }
            
            self.customCollections = documents.map { queryDocumentSnapshot -> Collection in
                let data = queryDocumentSnapshot.data()
                
                let userID = data["user_id"] as? String ?? ""
                   let collectionID = data["collection_id"] as? String ?? ""
                   let title = data["title"] as? String ?? ""
                   let subtitle = data["subtitle"] as? String ?? ""
                   let isSuggested = data["is_suggested"] as? Bool ?? false
                
                return Collection(collectionID: collectionID, userID: userID, title: title, subtitle: subtitle, isSuggested: isSuggested)
            }
        }
        isLoading = false
    }
    
    let title = "Collections"
    let subtitle = "Sort your items by collections"
    let customListTitle = "Custom lists"
    let suggestedListTitle = "Suggested lists"
    let emptyCustomListButtonTitle = "Add your first collection here"
    let anyCustomListButtonTitle = "Add collection here"
    
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
