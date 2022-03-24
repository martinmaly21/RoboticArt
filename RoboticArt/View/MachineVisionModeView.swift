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
                .cornerRadius(8)
                .onTapGesture {
                    withAnimation {
                        currentView = .chooseMode
                    }
                }
                
                Spacer()
            }
        }
        .onChange(
            of: machineVisionViewModel.frame,
            perform: { _ in
                var notesToPlay = [NoteType]()
                
                //left index
                if let tip =  machineVisionViewModel.leftIndexFingerLocations?.first,
                   let bottom = machineVisionViewModel.leftIndexFingerLocations?.last {
                    
                    //AND tip is over any key, then add that key to notesToPlay
                    if tip.y > bottom.y  {
                        notesToPlay.append(getNote(for: tip))
                    }
                }
                
                playNote(noteType: notesToPlay)
            }
        )
        .environmentObject(machineVisionViewModel)
    }
    
    func getNote(for point: CGPoint) -> NoteType {
        
        return NoteType.d1
    }
    
    func playNote(noteType: [NoteType]) {
        let convertedBinary: [UInt16] = noteType.compactMap { UInt16($0.binaryNote, radix: 2) }
        
        var intermediateResult: UInt16 = 0
        convertedBinary.forEach { intermediateResult = intermediateResult | $0 }
        
        let currentNote = String(intermediateResult, radix: 2).pad(toSize: 16)
        
        serialPortViewModel.sendData(currentNote)
    }
}
