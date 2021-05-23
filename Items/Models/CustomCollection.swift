//
//  CustomCollection.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import Foundation
import SwiftUI

struct CustomCollection: Identifiable, Hashable {
    
    let id = UUID()
    var collectionID: String
    var userID: String
    var title: String
    var subtitle: String
    var isSuggested: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
