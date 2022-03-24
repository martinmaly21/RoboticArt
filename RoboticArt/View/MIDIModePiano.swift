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
        case "Mary had a little lamb":
            await maryHadALittleLamb()
        case "Sweet but Psycho":
            await sweetButPsycho()
        case "Levels (intro)":
            await levels()
        default:
            fatalError()
        }
        
        //reset all fingers to off position
        await liftFingers(for: 1)
        
        withAnimation {
            currentView = .chooseSong
        }
    }
    
    func sweetButPsycho() async {
        await playNote(noteType: .off, for: 0.5)

        // oh  -
        await playNote(noteType: .c4, for: 0.72)
        await playNote(noteType: .off, for: 0.08)
        // shes - c
        await playNote(noteType: .c4, for: 0.72)
        await playNote(noteType: .off, for: 0.08)
        // sweet - c
        await playNote(noteType: .c4, for: 0.4)
        // but - b
        await playNote(noteType: .b2, for: 0.4)
        // a - c
        await playNote(noteType: .c4, for: 0.8)
        // psy - b
        await playNote(noteType: .b2, for: 0.8)
        // cho - g
        await playNote(noteType: .g2, for: 0.32)
        await playNote(noteType: .off, for: 0.08)
        // a - g
        await playNote(noteType: .g2, for: 0.32)
        await playNote(noteType: .off, for: 0.08)
        // lit - g
        await playNote(noteType: .g2, for: 0.32)
        await playNote(noteType: .off, for: 0.08)
        // tle - a
        await playNote(noteType: .a2, for: 0.4)
        // bit - b
        await playNote(noteType: .b2, for: 0.8)
        // psy - c4
        await playNote(noteType: .c4, for: 0.8)
        // cho - a
        await playNote(noteType: .a2, for: 0.32)
        await playNote(noteType: .off, for: 0.08)
        // at - a
        await playNote(noteType: .a2, for: 0.32)
        await playNote(noteType: .off, for: 0.08)
        // night - b
        await playNote(noteType: .b2, for: 0.4)
        // shes - a
        await playNote(noteType: .a2, for: 0.4)
        // scream - b
        await playNote(noteType: .b2, for: 0.4)
        // in - a
        await playNote(noteType: .a2, for: 0.4)
        // im - e
        await playNote(noteType: .e2, for: 0.4)
        // ma - b
        await playNote(noteType: .b2, for: 0.32)
        await playNote(noteType: .off, for: 0.08)
        // ma - b
        await playNote(noteType: .b2, for: 0.72)
        await playNote(noteType: .off, for: 0.08)
        // out - b
        await playNote(noteType: .b2, for: 0.4)
        // my - a
        await playNote(noteType: .a2, for: 0.32)
        await playNote(noteType: .off, for: 0.08)
        // mind - a
        await playNote(noteType: .g2, for: 0.4)
        // __ - g
        await playNote(noteType: .g2, for: 0.4)


        await playNote(noteType: .off, for: 0.03)
    }
    
    func drunkenSailor() async {
        await playNote(noteType: .off, for: 0.5)


        await playNote(noteType: [.a2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        // bar2

        await playNote(noteType: .off, for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.d2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.f2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.3)

        // bar 3

        await playNote(noteType: [.g2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.g2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.g2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.g2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.g2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.g2,.d1,.f1], for: 0.2)

        // bar4

        await playNote(noteType: .off, for: 0.1)

        await playNote(noteType: [.g2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.d2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.f2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.3)

        // bar5

        await playNote(noteType: [.a2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.2)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.2)

        // bar6

        await playNote(noteType: .off, for: 0.1)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.25)

        await playNote(noteType: [.d1,.f1], for: 0.1)

        await playNote(noteType: [.b2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.b2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.c4,.d1,.f1], for: 0.3)

        // bar 7

        await playNote(noteType: [.off], for: 0.1)

        await playNote(noteType: [.c4,.d1,.f1], for: 0.3)

        await playNote(noteType: [.a2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.g2,.d1,.f1], for: 0.3)

        await playNote(noteType: [.e2,.d1,.f1], for: 0.3)

        // bar 8

        await playNote(noteType: [.off], for: 0.2)

        await playNote(noteType: [.d2,.d1,.f1], for: 0.4)

        await playNote(noteType: [.off], for: 0.2)

        await playNote(noteType: [.d2,.d1,.f1], for: 0.4)

    }
    
    func maryHadALittleLamb() async {
        await playNote(noteType: .off, for: 0.5)

        // ma
        await playNote(noteType: .e2, for: 0.3)
        // ry
        await playNote(noteType: .d2, for: 0.3)
        // had
        await playNote(noteType: .c3, for: 0.3)
        // a
        await playNote(noteType: .d2, for: 0.3)
        // lit
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // tle
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lamb
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lit
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // tle
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lamb
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lit
        await playNote(noteType: .e2, for: 0.3)
        // tle
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lamb
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // ma
        await playNote(noteType: .e2, for: 0.3)
        // ry
        await playNote(noteType: .d2, for: 0.3)
        // had
        await playNote(noteType: .c3, for: 0.3)
        // a
        await playNote(noteType: .d2, for: 0.3)
        // lit
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // tle
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lamb
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // whose
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // fleece
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // was
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .d2, for: 0.1)
        // white
        await playNote(noteType: .e2, for: 0.3)
        // as
        await playNote(noteType: .d2, for: 0.3)
        // snow
        await playNote(noteType: .c3, for: 0.3)
    }
    
    func twinkleTwinkleLittleStar() async {
        await playNote(noteType: .off, for: 0.5)

        // twin
        await playNote(noteType: .c3, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // kle
        await playNote(noteType: .c3, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // twin
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // kle
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lit
        await playNote(noteType: .a2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // tle
        await playNote(noteType: .a2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // star
        await playNote(noteType: .g2, for: 0.4)

        // how
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // I
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // won
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // der
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // what
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // you
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // are
        await playNote(noteType: .c3, for: 0.4)

        // up
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // a
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // bove
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // the
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // world
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // so
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // high
        await playNote(noteType: .d2, for: 0.4)

        // like
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // a
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // dia
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // mond
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // in
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // the
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // sky
        await playNote(noteType: .d2, for: 0.4)

        // twin
        await playNote(noteType: .c3, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // kle
        await playNote(noteType: .c3, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // twin
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // kle
        await playNote(noteType: .g2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // lit
        await playNote(noteType: .a2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // tle
        await playNote(noteType: .a2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // star
        await playNote(noteType: .g2, for: 0.4)

        // how
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // I
        await playNote(noteType: .f2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // won
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // der
        await playNote(noteType: .e2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // what
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // you
        await playNote(noteType: .d2, for: 0.2)
        await playNote(noteType: .off, for: 0.1)
        // are
        await playNote(noteType: .c3, for: 0.4)

        // c chord
        await playNote(noteType: .off, for: 0.3)
        await playNote(noteType: [.c3,.e2,.g2], for: 0.35)
        await playNote(noteType: .off, for: 0.4)


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
    
    func levels() async {
        //play loop three times
        for _ in 0..<3 {
            //first 3
            await playNote(noteType: [.g1, .c3, .g2], for: 0.2)
            
            await liftFingers(for: 0.1)
            
            await playNote(noteType: [.g1, .c3, .g2], for: 0.2)
            
            await liftFingers(for: 0.1)
            
            await playNote(noteType: [.g1, .c3, .g2], for: 0.2)
            
            await liftFingers(for: 0.4)
            
            //next 4
            await playNote(noteType: [.e1, .b1, .b2], for: 0.3)
            
            await liftFingers(for: 0.1)
            
            await playNote(noteType: [.e1, .b1, .b2], for: 0.3)
            
            await liftFingers(for: 0.1)
            
            await playNote(noteType: [.e1, .b1, .b2], for: 0.3)
            
            await liftFingers(for: 0.1)
            
            await playNote(noteType: [.e1, .b1, .b2], for: 0.3)
            
            await liftFingers(for: 0.1)
            
            //next three
            await playNote(noteType: [.g1, .c2, .g2], for: 0.3)
            
            await liftFingers(for: 0.1)
            await playNote(noteType: [.g1, .c2, .g2], for: 0.3)
            
            await liftFingers(for: 0.1)
            await playNote(noteType: [.g1, .c2, .g2], for: 0.3)
            
            await liftFingers(for: 0.1)

            //next 1
            await playNote(noteType: [.e1, .a1, .e2], for: 0.15)
            await playNote(noteType: [.e1, .e2], for: 0.2)
            
            await liftFingers(for: 0.8)
            
            //final 3
            await playNote(noteType: [.e1, .a1, .e2], for: 0.2)
            await liftFingers(for: 0.1)
            
            await playNote(noteType: [.e1, .a1, .e2], for: 0.2)
            await liftFingers(for: 0.1)
            
            await playNote(noteType: [.e1, .a1, .e2], for: 0.2)
            await liftFingers(for: 0.1)
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
    
    func liftFingers(for time: Double) async {
        serialPortViewModel.sendData(NoteType.off.binaryNote)
        await Task.sleep(seconds: time)
    }
}
