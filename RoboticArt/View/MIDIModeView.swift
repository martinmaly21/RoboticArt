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
        
        Song(
            name: "Twinkle Twinkle Little Star",
            artist: "Nursery Rhyme",
            image: NSImage(named: "Twinkle")!
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

        var noteLength: Double
        
        noteLength = 0.15
        
        var offLength: Double
        
        offLength = 0.1
        
        //twinkle
        await playNote(noteType: .c3, for: noteLength)
        await playNote(noteType: .off, for: noteLength)
        await playNote(noteType: .c3, for: noteLength)
        
        
        //twinkle
        await playNote(noteType: .g2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .g2, for: noteLength)
        
        //little
        await playNote(noteType: .a2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .a2, for: noteLength)
        
        //Star
        await playNote(noteType: .g2, for: 2*noteLength) // end of line 1
        
        //how
        await playNote(noteType: .f2, for:noteLength )
        await playNote(noteType: .off, for: offLength)
        //I
        await playNote(noteType: .f2, for: noteLength)
        await playNote(noteType: .off, for: offLength)

        //wonder
        await playNote(noteType: .e2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .e2, for: noteLength)
        
        //what
        await playNote(noteType: .d2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        //you
        await playNote(noteType: .d2, for: noteLength)
        
        
        //are
        await playNote(noteType: .c3, for: 2*noteLength)    //end of line 2
        
        
        //up ab
        await playNote(noteType: .g2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .g2, for: noteLength)
        
        //ove the
        await playNote(noteType: .f2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .f2, for: noteLength)
        
        //world so
        await playNote(noteType: .e2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .e2, for: noteLength)

        //Highhhhh
        await playNote(noteType: .d2, for: 2*noteLength)    //end of line 3

        // like a
        await playNote(noteType: .g2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .g2, for: noteLength)
        
        //diamond
        await playNote(noteType: .f2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .f2, for: noteLength)
        
        
        //in the
        await playNote(noteType: .e2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .e2, for: noteLength)

        //sky
        await playNote(noteType: .d2, for: 2*noteLength)    //end of line 4



        //twinkle
        await playNote(noteType: .c3, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .c3, for: noteLength)
            
        //twinkle
        await playNote(noteType: .g2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .g2, for: noteLength)
    
        //little
        await playNote(noteType: .a2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .a2, for: noteLength)
        
        //staaar
        await playNote(noteType: .g2, for: 2*noteLength) // end of line 5
        
        
        
        
        //how  i
        await playNote(noteType: .f2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .f2, for: noteLength)
        

        // wonder
        await playNote(noteType: .e2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .e2, for: noteLength)
        
        
        //what you
        await playNote(noteType: .d2, for: noteLength)
        await playNote(noteType: .off, for: offLength)
        await playNote(noteType: .d2, for: noteLength)
        
        
        //are
        await playNote(noteType: .c3, for: 2*noteLength) //end of line 6

    }
    
    func playNote(noteType: NoteType, for seconds: Double) async {
        serialPortViewModel.sendData(noteType.binaryNote)
        await Task.sleep(seconds: seconds)
    }
    
    func playNote(noteType: [NoteType], for seconds: Double) async {
        let convertedBinary: [UInt16] = noteType.compactMap { UInt16($0.binaryNote, radix: 2) }
        
        var intermediateResult: UInt16 = 0
        convertedBinary.forEach { intermediateResult = intermediateResult | $0 }
        
        let resx = String(intermediateResult, radix: 2).pad(toSize: 16)
        
        serialPortViewModel.sendData(resx)
        await Task.sleep(seconds: seconds)
    }
    
    func liftFingers() async {
        serialPortViewModel.sendData(NoteType.off.binaryNote)
        await Task.sleep(seconds: 1)
    }
}
