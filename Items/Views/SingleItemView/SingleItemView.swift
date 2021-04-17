//
//  SingleItemView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct SingleItemView: View {
    
    @State var item: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.grayColor)
                
                VStack {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "trash")
                            .font(.system(size: 20))
                            .foregroundColor(.secondaryColor)
                    })
                    .offset(x: 60)
                    
                    Spacer()
                    
                    Image("\(item)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFill()
                }
                .offset(x: -10, y: 10)
            }
            .frame(width: 150, height: 200)
            
            VStack(alignment: .leading) {
                Text("Tracksuit")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("store: Zara")
                    .font(.caption)
                    .foregroundColor(.primary)
                
                Text("$ 99.99")
                    .font(.callout)
                    .foregroundColor(.primary)
            }
            .offset(x: -5, y: 10)
            .padding(.horizontal, 5)
        }
        .padding()
    }
}

struct SingleItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleItemView(item: 0)
            .preferredColorScheme(.dark)
    }
}
