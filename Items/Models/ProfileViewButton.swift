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
    var sheet: Sheets
    
    
    enum Sheets: Identifiable {
        case create
        case pro
        case privacy
        
        var id: Int {
            hashValue
        }
    }
}
