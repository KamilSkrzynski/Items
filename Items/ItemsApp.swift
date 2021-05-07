//
//  ItemsApp.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

@main
struct ItemsApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
                TabContainerView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
