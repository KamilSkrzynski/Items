//
//  ItemsArray.swift
//  Items
//
//  Created by Kamil Skrzyński on 23/05/2021.
//

import Foundation
import SwiftUI

final class ItemsArray: ObservableObject, Identifiable {
    
    @AppStorage("userID") private var userID = ""
    
    @Published var itemsArray = [Item]()
    
    init(item: Item) {
        self.itemsArray.append(item)
    }
    
    init(collection: String) {
        print(userID)
            DataService.instance.downloadItems(userID: self.userID, collection: collection) { returnedItems in
            self.itemsArray.append(contentsOf: returnedItems)
            print(self.itemsArray)
        }
    }
}

extension ItemsArray: Hashable {
    static func == (lhs: ItemsArray, rhs: ItemsArray) -> Bool {
        return lhs === rhs
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}
