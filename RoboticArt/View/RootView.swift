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
                SplashScreenView(currentView: $currentView)
            case .information:
                InformationView(currentView: $currentView)
            case .chooseMode:
                ChooseModeView(currentView: $currentView)
            case .machineVisionMode:
                MachineVisionModeView(currentView: $currentView)
            case .chooseSong:
                MIDIModeView(currentView: $currentView)
            case .midiModePiano(let song):
                MIDIModePiano(song: song)
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
