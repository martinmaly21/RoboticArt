//
//  RootView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI
 
struct RootView: View {
    @State private var currentView: CurrentView = .splashScreen
    
    var body: some View {
        VStack(alignment: .center) {
            switch currentView {
            case .splashScreen:
                SplashScreen(currentView: $currentView)
            case .information:
                Text("TODO: information")
            case .chooseMode:
                Text("TODO: chooseMode")
            case .machineVisionMode:
                Text("TODO: machineVisionMode")
            case .midiMode:
                Text("TODO: midiMode")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.red, Color.purple]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}
