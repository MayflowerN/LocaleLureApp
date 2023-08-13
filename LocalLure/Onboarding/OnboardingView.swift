//
//  OnboardingView.swift
//  LocalLure
//
//  Created by Ellie on 8/13/23.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Image("onboarding1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenWidth, height: screenHeight)
                .edgesIgnoringSafeArea(.all)
            
            TabView(selection: $tabSelection) {
                VStack(spacing: 20) {
                    Text("Welcome to LocaleLure")
                        .font(.custom("Russo One", size: 30))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 249, alignment: .top)
                        .padding(.top, 20)
                    
                    Text("LocaleLure helps you find the best of the city!")
                        .font(.custom("Proxima Nova", size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 279, alignment: .top)
                    
                    Spacer()
                }
                .tag(0)
                
                ZStack {
                    Image("onboarding2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screenWidth, height: screenHeight)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Ready to discover your city?")
                            .font(.custom("Russo One", size: 30))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 348, alignment: .top)
                            .padding(.top, 65)
                            .padding(.leading, 3)
                        
                        Text("We’ll show you the best restaurants, venues, and more, based on your location!")
                            .font(.custom("Proxima Nova", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 281, alignment: .top)
                            .padding(5)
                            .padding(.leading, 3)
                        
                        Spacer()
                    }
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                } else {
                    model.requestGeolocationPermission()
                }
            } label: {
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.93, green: 0.35, blue: 0.93))
                            .frame(width: 230, height: 57)
                            .cornerRadius(15)
                        
                        Text(tabSelection == 0 ? "Next" : "Get My Location")
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 30)
                }
            }
            .padding()
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
