//
//  SplashScreen.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var currentView: CurrentView
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Text("Welcome to Robotic Art!")
                    .font(.system(size: 60))
                    .bold()
                
                Text("An ELEC 490 project designed by Nicholas Alderman, Drew Anderson, Carter Jan, Martin Maly, and Charlie Maslenchko")
                    .font(.system(size: 25))
                
                Spacer()
                    .frame(height: 100)
                
                
                CirclePulseButton(
                    color: .mint,
                    text: "👌 to begin",
                    buttonDimension: 250,
                    numberOfOuterCircles: 15,
                    animationDuration: 1
                )
                    .onTapGesture {
                        withAnimation {
                            currentView = .onboarding2
                        }
                    }
            }
    
        }
        .padding(.top, 300)
        
        
        Spacer()
    }
}
