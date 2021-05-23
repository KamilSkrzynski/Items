//
//  TabContainerView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct TabContainerView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isOnboardingWatched") private var isOnboardingToWatch = true
    let posts = CollectionsArray(isSuggested: true)
    @AppStorage("userID") private var userID = ""
    @State var selectedTab: Int = 0
    @State var showAddSheet: Bool = false
    
    var body: some View {
        
        VStack {
            if selectedTab == 0 {
                NavigationView {
                    CollectionsView()
                }

            }
            else if selectedTab == 1 {
                NavigationView {
                ProfileView()
                }
            }
            HStack {
                Button(action: {
                    self.selectedTab = 0
                }, label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .offset(x: 10, y: -5)
                        .font(.system(size: 30))
                        .foregroundColor(Color.primary.opacity(selectedTab == 0 ? 1.0 : 0.3))
                })
                
                Spacer(minLength: 0)
                
                Button(action: {
                    self.showAddSheet.toggle()
                }, label: {
                    ZStack {
                        Circle()
                            //      .stroke(Color.black)
                            .foregroundColor(Color.secondaryColor)
                            .frame(width: 80, height: 80)
                      //      .shadow(color: .primary, radius: 5)
                        
                        Circle()
                            .foregroundColor(Color.mainColor)
                            .frame(width: 73, height: 73)
                        
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .foregroundColor(.primary)
                    }
                })
                .offset(y: -30)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    self.selectedTab = 1
                    
                }, label: {
                    Image(systemName: "person.fill")
                        .offset(x: -10, y: -5)
                        .font(.system(size: 30))
                        .foregroundColor(Color.primary.opacity(selectedTab == 1 ? 1.0 : 0.3))
                })
            }
            .frame(maxWidth:. infinity)
            .padding(.horizontal, 50)
            .frame(height: 100)
            .background(Color.grayColor)
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(.primary)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $isOnboardingToWatch) {
            NavigationView {
                OnboardingView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
        .fullScreenCover(isPresented: $showAddSheet) {
            NavigationView {
                AddItemView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}

struct TabContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainerView()
            .preferredColorScheme(.dark)
        
        
        TabContainerView()
            .preferredColorScheme(.light)
    }
}
