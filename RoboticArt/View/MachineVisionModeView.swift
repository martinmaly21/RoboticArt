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
        ZStack(alignment: .topLeading) {
            CameraFeedView()
            
            PianoView(title: "🎵 Play some tunes! 🎵")
            
            HStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 25, height: 40)
                        .foregroundColor(Color.white)
                        .padding(.leading, 12)
                    
                    Text("Back")
                        .aspectRatio(contentMode: .fill)
                        .font(.system(size: 30))
                        .frame(width: 150, height: 40)
                        .padding(.leading, -20)
                }
                .padding([.top, .bottom], 8)
                .background(.thinMaterial)
                .cornerRadius(8)
                .onTapGesture {
                    withAnimation {
                        currentView = .chooseMode
                    }
                }
                
                Spacer()
            }
        }
        .environmentObject(machineVisionViewModel)
    }
}
