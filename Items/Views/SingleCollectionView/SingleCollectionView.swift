//
//  SingleCollectionView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct SingleCollectionView: View {
    
    @StateObject var viewModel: SingleCollectionViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Image(viewModel.imageName)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFill()
                    .offset(x: -15, y: -10)
                
                Spacer()
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(viewModel.subtitle)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 180, height: 280)
            .background(Color.grayColor)
            .padding()
        }
    }
}

struct SingleCollectionView_Previews: PreviewProvider {
    static let viewModel = SingleCollectionViewModel(title: "Tech", subtitle: "Test tech expand", imageName: "Tech")
    static var previews: some View {
        SingleCollectionView(viewModel: viewModel)
            .preferredColorScheme(.light)
    }
}
