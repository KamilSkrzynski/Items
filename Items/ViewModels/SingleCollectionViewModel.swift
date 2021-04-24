//
//  SingleCollectionViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 18/04/2021.
//

import Foundation

final class SingleCollectionViewModel: ObservableObject {
    
    init(title: String, subtitle: String, imageName: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }
    
    var imageName: String
    var title: String
    var subtitle: String

    let iconImageName = "chevron.right"
    
}

extension SingleCollectionViewModel: Hashable {
    static func == (lhs: SingleCollectionViewModel, rhs: SingleCollectionViewModel) -> Bool {
        return lhs === rhs
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
    
    
}

    
