//
//  InformationView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct InformationView: View {
    @Binding var currentView: CurrentView
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Text("Meet Edbot Crookedhands")
                    .font(.system(size: 60))
                    .bold()
                
                Text("Edbot is a robotic pianist who is capable of playing known songs, as well as mimicking humans!")
                    .font(.system(size: 25))
                
                Spacer()
                    .frame(height: 100)
                
                
                CirclePulseButton(
                    color: .mint,
                    text: "Continue",
                    buttonDimension: 250,
                    numberOfOuterCircles: 15,
                    animationDuration: 1
                )
                    .onTapGesture {
                        withAnimation {
                            currentView = .tappableDemo
                        }
                    }
            }
    
        }
        .padding(.top, 300)
        
        
        Spacer()
    }
}
