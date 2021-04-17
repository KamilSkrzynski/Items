//
//  ProfileViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    
    @Published var title = "Profile"
    @Published var chevron = "chevron.right"
    @Published var createPushed = false    
}
