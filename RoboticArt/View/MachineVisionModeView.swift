//
//  MachineVisionModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct MachineVisionModeView: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @StateObject private var machineVisionViewModel = MachineVisionViewModel()

    @Binding var currentView: CurrentView
    
    var body: some View {
        ZStack {
            CameraFeedView(image: machineVisionViewModel.frame)
            
            PianoView()
        }
    }
}
