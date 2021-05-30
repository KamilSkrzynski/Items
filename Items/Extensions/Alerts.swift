//
//  Alerts.swift
//  Items
//
//  Created by Kamil Skrzyński on 30/05/2021.
//

import Foundation
import SwiftUI

extension Alert {
    
    enum Alerts {
        
        case logout
        case newItem
        case newCollection
        case deleteCollection
        case deleteItem
        case tagAsBought
        
        
        var alertType: Alert {
            switch self {
            case .logout:
                return Alert(title: Text("Logout"), message: Text("Are you sure you want to logout?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Logout").fontWeight(.bold)))
            case .newItem:
                return Alert(title: Text("Created!"), message: Text("Item successfully created"), dismissButton: .default(Text("OK")))
            case .newCollection:
                return Alert(title: Text("Created!"), message: Text("Collection successfully created"), dismissButton: .default(Text("OK")))
            case .deleteCollection:
                return Alert(title: Text("Delete Collection"), message: Text("Are you sure you want to delete this collection?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete").fontWeight(.bold)))
            case .deleteItem:
                return Alert(title: Text("Delete Item"), message: Text("Are you sure you want to delete this item?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete").fontWeight(.bold)))
            case .tagAsBought:
                return Alert(title: Text("Bought?"), message: Text("Are you sure you want to tag this item as bought?"), primaryButton: .cancel(), secondaryButton: .default(Text("Bought").fontWeight(.bold)))
            }
        }
    }
}
