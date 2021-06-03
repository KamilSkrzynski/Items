//
//  ProgressCircleView.swift
//  Items
//
//  Created by Kamil Skrzyński on 03/06/2021.
//

import SwiftUI

struct ProgressCircleView: View {
    
    @ObservedObject private var viewModel = ProgressCircleViewModel()
    var type: String
    @State private var percentage: CGFloat = 0.0
    @AppStorage("userID") private var userID = ""

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 7)
                .foregroundColor(.appColor)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(type == "items" ? (Double(viewModel.items.count)/50.0) : (Double(viewModel.collections.count)/1.0)))
                .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(Animation.spring(response: 4).delay(1))
            Text("\(type == "items" ? viewModel.items.count : viewModel.collections.count) of \(type == "items" ? 50 : 1)")
        }
        .frame(width: 70, height: 70)
        .onAppear {
            viewModel.fetchItems(userID: userID)
            viewModel.fetchCollections(userID: userID)
        }
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(type: "items")
    }
}
