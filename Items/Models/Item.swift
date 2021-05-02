//
//  Item.swift
//  Items
//
//  Created by Kamil Skrzyński on 02/05/2021.
//

import Foundation
import SwiftUI

struct Item {
    
    let id = UUID()
    var userID: String
    var name: String
    var tag: String?
    var store: String?
    var image: UIImage
    var collection: String
}
