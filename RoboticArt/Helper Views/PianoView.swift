//
//  PianoView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-08.
//

import SwiftUI

struct PianoView: View {
    @StateObject var serialPortViewModel = SerialPortViewModel()
    
    private var notes: [NoteType] = NoteType.allCases
    
    var body: some View {
        VStack {
            HStack {
                Text("🎵 Play some tunes! 🎵")
                    .font(.system(size: 60))
                    .bold()
//                    .padding(.top, 190)
                
                Spacer()
            }
            .padding(.bottom, 150)
            
            HStack(spacing: 100) {
                PianoOctaveView(
                    octaveName: "Octave 1",
                    notes: Array(notes.prefix(notes.count / 2))
                )

                PianoOctaveView(
                    octaveName: "Octave 2",
                    notes: Array(notes.suffix(notes.count / 2))
                )
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(30)
        }
        .padding()
        .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PianoView()
    }
}
