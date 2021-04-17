//
//  ProfileViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    
    let title = "Profile"
    let chevron = "chevron.right"
    
    @Published var createPushed = false
    
    var buttons = [
        ProfileViewButton(imageName: "person.crop.circle.fill.badge.plus", title: "Create Account", sheet: .create),
        ProfileViewButton(imageName: "lightbulb.fill", title: "Switch to Dark Mode", sheet: .pro),
        ProfileViewButton(imageName: "shield.lefthalf.fill", title: "Privacy Policy", sheet: .privacy)
    ]
}
