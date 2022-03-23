//
//  MIDIModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct MIDIModeView: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @Binding var currentView: CurrentView
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            Button(
                action: {
                    
                    Task {
                        await playNote(noteType: .c1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .c1, for: 0.5)

                        await playNote(noteType: .g1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .g1, for: 0.5)
                        
                        await playNote(noteType: .a1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .a1, for: 0.5)
                        
                        await playNote(noteType: .g1, for: 0.5)
                        
                        await playNote(noteType: .f1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .f1, for: 0.5)
                        
                        await playNote(noteType: .e1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .e1, for: 0.5)
                        
                        await playNote(noteType: .d1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .d1, for: 0.5)
                        
                        await playNote(noteType: .c1, for: 0.5)
                        
                        
                        //
                        await playNote(noteType: .g1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .g1, for: 0.5)
                        
                        await playNote(noteType: .f1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .f1, for: 0.5)
                        
                        await playNote(noteType: .e1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .e1, for: 0.5)
                        
                        await playNote(noteType: .d1, for: 0.5)
                        
                        //
                        await playNote(noteType: .g1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .g1, for: 0.5)
                        
                        await playNote(noteType: .f1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .f1, for: 0.5)
                        
                        await playNote(noteType: .e1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .e1, for: 0.5)
                        
                        await playNote(noteType: .d1, for: 0.5)
                        
                        //
                        await playNote(noteType: .c1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .c1, for: 0.5)

                        await playNote(noteType: .g1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .g1, for: 0.5)
                        
                        await playNote(noteType: .a1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .a1, for: 0.5)
                        
                        await playNote(noteType: .g1, for: 0.5)
                        
                        await playNote(noteType: .f1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .f1, for: 0.5)
                        
                        await playNote(noteType: .e1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .e1, for: 0.5)
                        
                        await playNote(noteType: .d1, for: 0.5)
                        await liftFingers()
                        await playNote(noteType: .d1, for: 0.5)
                        
                        await playNote(noteType: .c1, for: 0.5)
                    }

                },
                label: {
                    Text("Play test")
                }
            )
            
            
            TextField(
                    "Data to send arduino",
                    text: $messageText
                )
            
            Button(
                action: {
                    serialPortViewModel.sendData(messageText)
                },
                label: {
                    
                    Text("Send!")
                }
            )
        }
        .padding()
    }
    
    func playNote(noteType: NoteType, for seconds: Double) async {
        serialPortViewModel.sendData(noteType.binaryNote)
        await Task.sleep(seconds: 1)
    }
    
    func liftFingers() async {
        serialPortViewModel.sendData(NoteType.off.binaryNote)
        await Task.sleep(seconds: 0.1)
    }
}
