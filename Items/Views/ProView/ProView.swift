//
//  ProView.swift
//  Items
//
//  Created by Kamil Skrzyński on 17/04/2021.
//

import SwiftUI

struct ProView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedOption = 0
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Upgrade to unlock")
                        .font(.headline)
                    Spacer()
                }
                
                proBenefits
                
                Text("Your first 7 days are free. No charge until your 7 day free trial ends. Cancel anytime.")
                    .padding(.bottom)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                button1
                button2
                button3
                
                HStack {
                    Spacer()
                    Text("Privacy Policy")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .underline()
                    Spacer()
                    Text("Terms of Use")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .underline()
                    Spacer()
                }.padding(.bottom)
                
                Button(action: {
                    
                }, label: {
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.724828855, green: 0.4041588916, blue: 0.08592099306, alpha: 1))]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .mask(
                            Text("Start your 7 day free trial now")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        )
                        .background(Color.grayColor)
                        .frame(height: 60)
                })
                
                Spacer()
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Get Items Pro")
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.primary)
                                }))
    }
    
    var proBenefits: some View {
        VStack {
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 25, height: 25)
                    ZStack {
                        Image(systemName: "poweroff")
                            .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.1607843137, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        Image(systemName: "square.split.diagonal.fill")
                            .foregroundColor(.grayColor)
                            .offset(x: 5, y: -5)
                    }
                    .offset(x: -5, y: 5)
                }
                Text("Enable dark mode")
                Spacer()
            }
            .padding(.vertical)
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 25, height: 25)
                    ZStack {
                        Image(systemName: "poweroff")
                            .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.1607843137, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        Image(systemName: "square.split.diagonal.fill")
                            .foregroundColor(.grayColor)
                            .offset(x: 5, y: -5)
                    }
                    .offset(x: -5, y: 5)
                }
                Text("Unlimited items addition")
                Spacer()
            }
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 25, height: 25)
                    ZStack {
                        Image(systemName: "poweroff")
                            .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.1607843137, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        Image(systemName: "square.split.diagonal.fill")
                            .foregroundColor(.grayColor)
                            .offset(x: 5, y: -5)
                    }
                    .offset(x: -5, y: 5)
                }
                Text("No limit for own collections")
                Spacer()
            }
            .padding(.vertical)
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 25, height: 25)
                    ZStack {
                        Image(systemName: "poweroff")
                            .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.1607843137, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        Image(systemName: "square.split.diagonal.fill")
                            .foregroundColor(.grayColor)
                            .offset(x: 5, y: -5)
                    }
                    .offset(x: -5, y: 5)
                }
                Text("No adverts")
                Spacer()
            }
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 25, height: 25)
                    ZStack {
                        Image(systemName: "poweroff")
                            .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.1607843137, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        Image(systemName: "square.split.diagonal.fill")
                            .foregroundColor(.grayColor)
                            .offset(x: 5, y: -5)
                    }
                    .offset(x: -5, y: 5)
                }
                Text("Support an independent developer")
                Spacer()
            }
            .padding(.vertical)
        }
    }
    
    var button1: some View {
        VStack {
            ZStack {
                HStack {
                    Rectangle()
                        .frame(width: 240, height: 80)
                        .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.724828855, green: 0.4041588916, blue: 0.08592099306, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .offset(x: -5)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("$ 0,83 a month")
                            .font(.footnote)
                        Spacer()
                        Text("Save 58%")
                            .font(.footnote)
                    }
                    HStack {
                        Text("12 months")
                            .font(.headline)
                        Spacer()
                        Text("$ 9,99")
                            .font(.headline)
                    }
                }
                .accentColor(.primary)
                .padding()
                .background(Color.grayColor)
            }
            .frame(height: 60)
        }
        .accentColor(.primary)
        .opacity(selectedOption == 0 ? 1.0 : 0.1)
        .onTapGesture {
            selectedOption = 0
        }
    }
    
    var button2: some View {
        VStack {
            ZStack {
                HStack {
                    Rectangle()
                        .frame(width: 60, height: 80)
                        .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.724828855, green: 0.4041588916, blue: 0.08592099306, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .offset(x: -5)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("$ 1,66 a month")
                            .font(.footnote)
                        Spacer()
                        Text("Save 17%")
                            .font(.footnote)
                    }
                    HStack {
                        Text("3 months")
                            .font(.headline)
                        Spacer()
                        Text("$ 4,99")
                            .font(.headline)
                    }
                }
                .accentColor(.primary)
                .padding()
                .background(Color.grayColor)
            }
            .frame(height: 60)
        }
        .accentColor(.primary)
        .opacity(selectedOption == 1 ? 1.0 : 0.1)
        .padding(.vertical)
        .onTapGesture {
            selectedOption = 1
        }
    }
    
    var button3: some View {
        VStack {
            ZStack {
                HStack {
                    Rectangle()
                        .frame(width: 20, height: 80)
                        .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6862745098, green: 0.1098039216, blue: 0.3568627451, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.3058823529, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.724828855, green: 0.4041588916, blue: 0.08592099306, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .offset(x: -5)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("$ 1,99 a month")
                            .font(.footnote)
                        Spacer()
                        
                    }
                    HStack {
                        Text("1 month")
                            .font(.headline)
                        Spacer()
                        Text("$ 1,99")
                            .font(.headline)
                    }
                }
                .accentColor(.primary)
                .padding()
                .background(Color.grayColor)
            }
            .frame(height: 60)
        }
        .accentColor(.primary)
        .opacity(selectedOption == 2 ? 1.0 : 0.1)
        .padding(.bottom)
        .onTapGesture {
            selectedOption = 2
        }
    }
}

struct ProView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProView()
                .preferredColorScheme(.dark)
        }
        
        NavigationView {
            ProView()
                .preferredColorScheme(.light)
        }
        
        
        ProView().previewDevice("iPhone 8")
        
    }
}
