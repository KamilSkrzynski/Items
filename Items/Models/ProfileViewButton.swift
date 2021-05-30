//
//  ProfileViewButton.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import Foundation

struct ProfileViewButton: Hashable {
    
    
    var imageName: String
    var title: String
    var type: ProfileViewButtonType
    
    
    enum ProfileViewButtonType: Identifiable {
        case create
        case pro
        case privacy
        
        var id: Int {
            hashValue
        }
    }
}
