//
//  SubscriptionButton.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import Foundation
import SwiftUI

struct SubscriptionButton: Hashable {
    
    var valuePerMonth: String
    var subscriptionLength: String
    var payAmount: String
    var savePercentage: String
    var selectedOption: Int
    var width: CGFloat
}
