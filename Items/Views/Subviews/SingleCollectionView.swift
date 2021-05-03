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
                    .padding(.horizontal)
                    .offset(y: -2)
                
                Divider()
                    .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(viewModel.subtitle)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .padding()
            .frame(width: 180, height: 300)
            .background(Color.grayColor)
        }
        .padding(.leading)
        
    }
    
}

struct SingleCollectionView_Previews: PreviewProvider {
    static let viewModel = SingleCollectionViewModel(title: "Tech", subtitle: "Test tech expand", imageName: "Tech")
    static var previews: some View {
        SingleCollectionView(viewModel: viewModel)
            .preferredColorScheme(.light)
    }
}
