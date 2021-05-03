//
//  ProfileViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import Foundation
import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @Published private(set) var itemViewModels: [ProfileItemViewModel] = []
    
    func onAppear() {
        buildItems()
    }
    
    private func buildItems() {
        itemViewModels = [
            .init(name: "Create Account", image: "person.crop.circle.fill.badge.plus", type: .account),
            .init(name: "Switch to \(isDarkMode ? "Light" : "Dark") Mode", image: "lightbulb.fill", type: .mode),
            .init(name: "Privacy Policy", image: "shield.lefthalf.fill", type: .privacy)
        ]
    }
    
    func tappedItem(at index: Int) {
        switch itemViewModels[index].type {
        case .mode:
            isDarkMode = !isDarkMode
            buildItems()
        case .account:
            createPushed = true
        default:
            break
        }
    }
    
    let title = "Profile"
    let subtitle = "Manage your profile"
    let chevron = "chevron.right"
    
    @Published var createPushed = false
}
