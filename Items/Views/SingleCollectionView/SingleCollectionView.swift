//
//  SingleCollectionView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct SingleCollectionView: View {
    
    @State var collection: String
    
    var body: some View {
        HStack {
            Image(collection)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFill()
                .offset(x: 10, y: 10)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Tech")
                    .font(.headline)
                
                Text("Save your tech essentials")
                    .font(.callout)
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .offset(x: -5)
        }
        .background(Color.grayColor)
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct SingleCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCollectionView(collection: "Tech")
            .preferredColorScheme(.dark)
    }
}
