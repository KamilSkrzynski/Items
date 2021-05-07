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
        OnboardingItem(title: "Create your own collections", subtitle: "1sub", image: "Onboarding1", selection: 0),
        OnboardingItem(title: "2", subtitle: "2sub", image: "Onboarding1", selection: 1),
        OnboardingItem(title: "3", subtitle: "3sub", image: "Onboarding1", selection: 2)
    ]
}

struct OnboardingItem: Hashable {
    var title: String
    var subtitle: String
    var image: String
    var selection: Int
}
