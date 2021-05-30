//
//  CollectionsArray.swift
//  Items
//
//  Created by Kamil Skrzyński on 16/05/2021.
//

import Foundation
import SwiftUI

final class CollectionsArray: ObservableObject, Identifiable {
    
    @AppStorage("userID") private var userID = ""
    
    @Published var collectionArray = [Collection]()
    
    init(collection: Collection) {
        self.collectionArray.append(collection)
    }
    
    init(isSuggested: Bool) {
        print(userID)
            DataService.instance.downloadCollections(userID: self.userID, isSuggested: isSuggested) { returnedCollections in
            self.collectionArray.append(contentsOf: returnedCollections)
            print(self.collectionArray)
        }
    }
}

extension CollectionsArray: Hashable {
    static func == (lhs: CollectionsArray, rhs: CollectionsArray) -> Bool {
        return lhs === rhs
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}
