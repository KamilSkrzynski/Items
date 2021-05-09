//
//  ItemsApp.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI
import Firebase

@main
struct ItemsApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isSignedIn") private var isSignedIn = false
    
    init() {
        print("Setting up Firebase..")
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if isSignedIn == true {
                TabContainerView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            else {
                LandingView()
            }
        }
    }
}
