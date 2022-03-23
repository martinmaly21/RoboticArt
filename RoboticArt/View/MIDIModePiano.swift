//
//  MIDIModePiano.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-22.
//

import SwiftUI

struct MIDIModePiano: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @Binding var currentView: CurrentView
    
    let song: Song
    
    var body: some View {
        PianoView(title: "\(song.name) by \(song.artist)")
            .onAppear {
                Task {
                    await playSong()
                }
            }
    }
    
    func playSong() async {
        switch song.name {
        case "Drunken Sailor":
            await drunkenSailor()
        case "Twinkle Twinkle Little Star":
            await twinkleTwinkleLittleStar()
        case "Jingle Bells":
            await jingleBells()
        default:
            fatalError()
        }
        
        //reset all fingers to off position
        await liftFingers()
        
        withAnimation {
            currentView = .chooseSong
        }
    }
    
    func drunkenSailor() async {
        await playNote(noteType: .off, for: 0.5)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.2)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        // bar2
        
        await playNote(noteType: .off, for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.2)
        
        await playNote(noteType: [.d2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.f2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        // bar 3
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.2)
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        // bar4
        
        await playNote(noteType: .off, for: 0.1)
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.2)
        
        await playNote(noteType: [.d2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.f2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        // bar5
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.2)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        // bar6
        
        await playNote(noteType: .off, for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.d1,.f1], for: 0.1)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.b2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.c4,.d1,.f1], for: 0.5)
        
        // bar 7
        
        await playNote(noteType: [.off], for: 0.1)
        
        await playNote(noteType: [.c4,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.a2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.g2,.d1,.f1], for: 0.5)
        
        await playNote(noteType: [.e2,.d1,.f1], for: 0.5)
        
        // bar 8
        
        await playNote(noteType: [.off], for: 0.2)
        
        await playNote(noteType: [.d2,.d1,.f1], for: 1)
        
        await playNote(noteType: [.off], for: 0.2)
        
        await playNote(noteType: [.d2,.d1,.f1], for: 1)
    }
    
    func twinkleTwinkleLittleStar() async {
        var noteLength: Double
        
        noteLength = 0.1
        
        var offLength: Double
        
        offLength = 0.02
        
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
    
    func jingleBells() async {
        let noteLength = 0.2
        let offLength = 0.03
        
        let song: [(NoteType, Double)] = [
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,2*noteLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,2*noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.g2,noteLength),
            (.c2,noteLength),
            (.d2,noteLength),
            (.e2,4*noteLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.e2,noteLength),
            (.d2,noteLength),
            (.off,offLength),
            (.d2,noteLength),
            (.e2,noteLength),
            (.d2,2*noteLength),
            (.g2,2*noteLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,2*noteLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,2*noteLength),
            (.e2,noteLength),
            (.g2,noteLength),
            (.c2,noteLength),
            (.d2,noteLength),
            (.e2,4*noteLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.off,offLength),
            (.f2,noteLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.off,offLength),
            (.e2,noteLength),
            (.g2,noteLength),
            (.off,offLength),
            (.g2,noteLength),
            (.f2,noteLength),
            (.d2,noteLength),
            (.c2,noteLength),
        ]
        
        for note in song{
            await playNote(noteType: note.0, for: note.1)
        }
    }
    
    func playNote(noteType: NoteType, for seconds: Double) async {
        serialPortViewModel.sendData(noteType.binaryNote)
        await Task.sleep(seconds: seconds)
    }
    
    func playNote(noteType: [NoteType], for seconds: Double) async {
        let convertedBinary: [UInt16] = noteType.compactMap { UInt16($0.binaryNote, radix: 2) }
        
        var intermediateResult: UInt16 = 0
        convertedBinary.forEach { intermediateResult = intermediateResult | $0 }
        
        let currentNote = String(intermediateResult, radix: 2).pad(toSize: 16)
        
        serialPortViewModel.sendData(currentNote)
        
        await Task.sleep(seconds: seconds)
    }
    
    func liftFingers() async {
        serialPortViewModel.sendData(NoteType.off.binaryNote)
        await Task.sleep(seconds: 1)
    }
}
