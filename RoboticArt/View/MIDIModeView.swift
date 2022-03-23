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
    
    let songs: [Song] = [
        Song(
            name: "Drunken Sailor",
            artist: "Irish Rovers",
            image: NSImage(named: "DrunkenSailor")!
        ),
    
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Choose song to play!")
                .font(.system(size: 60))
                .bold()
                .padding(40)
            
            ForEach(
                songs,
                id: \.self,
                content: { song in
                    MIDISongCell(song: song)
                        .onTapGesture {
                            Task {
                                await playSong(song)
                            }
                        }
                }
            )
            
            Spacer()
        }
        .padding()
    }
    
    
    func playSong(_ song: Song) async {
        switch song.name {
        case "Drunken Sailor":
            await drunkenSailor()
            
        case "Twinkle Twinkle Little Star":
            await twinkleTwinkleLittleStar()
            
        default:
            fatalError()
        }
    }
    
    func drunkenSailor() async {
        await playNote(noteType: [.a2,.d1,.f1], for: 0.1)

        // keep left hand on
        await playNote(noteType: [.d1,.f1], for: 0.385)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.1)

        // keep left hand on
        await playNote(noteType: [.d1,.f1], for: 0.185)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.095)
        // keep left hand on
        await playNote(noteType: [.d1,.f1], for: 0.185)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.1)

        // keep left hand on
        await playNote(noteType: [.d1,.f1], for: 0.185)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.1)
    }
    
    func twinkleTwinkleLittleStar() async {
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
    
    func playNote(noteType: NoteType, for seconds: Double) async {
        serialPortViewModel.sendData(noteType.binaryNote)
        await Task.sleep(seconds: 1)
    }
    
    func liftFingers() async {
        serialPortViewModel.sendData(NoteType.off.binaryNote)
        await Task.sleep(seconds: 0.1)
    }
}
