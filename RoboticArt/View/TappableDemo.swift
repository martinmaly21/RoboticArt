//
//  TappableDemo.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-23.
//

import SwiftUI

struct TappableDemo: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @Binding var currentView: CurrentView
    
    var body: some View {
        PianoView(title: "Try clicking on the keys to play ed")
            .onAppear {
                Task {
                    
                    //stay on this screen for 10 seconds before seguing
                    await Task.sleep(seconds: 10)
                    serialPortViewModel.sendData(NoteType.off.binaryNote)
                    
                    withAnimation {
                        currentView = .multipleKeysAtOnceDemo
                    }
                }
            }
    }
}
