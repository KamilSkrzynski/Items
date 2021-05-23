//
//  Item.swift
//  Items
//
//  Created by Kamil Skrzyński on 02/05/2021.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Hashable {
    
    let id = UUID()
    var userID: String
    var name: String
    var tag: String
    var collection: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
