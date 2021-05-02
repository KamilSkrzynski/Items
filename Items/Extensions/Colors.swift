//
//  Colors.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import Foundation
import SwiftUI

extension Color {
    static let grayColor = Color("grayColor")
    static let appColor = Color("appColor")
    static let mainColor = Color("mainColor")
    static let secondaryColor = Color("secondaryColor")
}

extension Gradient {
    static let primaryGradient = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.09803921569, green: 0.4941176471, blue: 0.6666666667, alpha: 1)), Color(#colorLiteral(red: 0.7725490196, green: 0.1490196078, blue: 0.6823529412, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

