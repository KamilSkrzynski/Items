//
//  SuggestedCollection.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import Foundation
import SwiftUI

struct SuggestedCollection: Hashable {
    
    let id = UUID().uuidString
    var title: String
    var subtitle: String
    let imageName: UIImage
}
