//
//  OnboardingViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 04/05/2021.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    
    @Published var tabSelection = 0
    
    let title = "Welcome to Items!"
    let skipButtonTitle = "Skip"
    
    let views = [
        OnboardingItem(title: "Create your own collections", subtitle: "Customize the way you track shoppings. Make custom collections to sort your needs.", image: "Onboarding1", selection: 0),
        OnboardingItem(title: "Add items", subtitle: "Fill in collections with things you need to buy. Use tag to sort items within collections.", image: "Onboarding2", selection: 1),
        OnboardingItem(title: "Search. Tag as bought. Delete", subtitle: "Search items via name or tag. Tag them when you buy it. When you make mistake - don't worry, just delete.", image: "Onboarding3", selection: 2)
    ]
}

struct OnboardingItem: Hashable {
    var title: String
    var subtitle: String
    var image: String
    var selection: Int
}
