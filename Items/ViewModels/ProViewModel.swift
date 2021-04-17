//
//  ProViewModel.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import Foundation

final class ProViewModel: ObservableObject {
    
    let title = "Get Items Pro"
    let subtitle = "Upgrade to unlock"
    let buttonTitle = "Start your 7 day free trial now"
    let trialText = "Your first 7 days are free. No charge until your 7 day free trial ends. Cancel anytime."
    let benefitImageName = "square.split.diagonal.fill"
    let closeIconImage = "xmark"
    
    var benefits = [
        ProBenefitLine(title: "Enable dark mode"),
        ProBenefitLine(title: "Unlimited items addition"),
        ProBenefitLine(title: "No limit for own collections"),
        ProBenefitLine(title: "No adverts"),
        ProBenefitLine(title: "Support an independent developer")
    ]
    
    var subscriptionButtons = [
        SubscriptionButton(valuePerMonth: "$ 0,83 a month",
                           subscriptionLength: "12 months",
                           payAmount: "$ 9,99",
                           savePercentage: "Save 58%",
                           selectedOption: 0,
                           width: 240),
        
        SubscriptionButton(valuePerMonth: "$ 1,66 a month",
                           subscriptionLength: "3 months",
                           payAmount: "$ 4,99",
                           savePercentage: "Save 17%",
                           selectedOption: 1,
                           width: 160),
        
        SubscriptionButton(valuePerMonth: "$ 1,99 a month",
                           subscriptionLength: "1 month",
                           payAmount: "$ 1,99",
                           savePercentage: "",
                           selectedOption: 2,
                           width: 80)
    ]
}
