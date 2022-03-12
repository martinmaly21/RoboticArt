//
//  ChooseModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct ChooseModeView: View {
    @Binding var currentView: CurrentView
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Text("Choose Mode")
                    .font(.system(size: 60))
                    .bold()
                    .padding(.bottom, 40)
                
                HStack {
                    ModeView(modeTitle: "Computer Vision", modeImage: nil)
                        .onTapGesture {
                            currentView = .machineVisionMode
                        }
                    
                    ModeView(modeTitle: "MIDI", modeImage: nil)
                        .onTapGesture {
                            currentView = .midiMode
                        }
                }
                
                Spacer()
                    .frame(height: 100)
            }
    
        }
        .padding(.top, 300)
        
        Spacer()
    }
}
