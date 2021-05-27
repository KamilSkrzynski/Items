//
//  ProfileItemViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 02/05/2021.
//

import Foundation

extension ProfileViewModel {
    struct ProfileItemViewModel {
        let name: String
        let image: String
        let type: ProfileItemType
    }
    
    enum ProfileItemType {
        case account
        case mode
        case privacy
        case logout
        case bought
    }
}
