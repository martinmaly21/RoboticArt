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
            Text("🎵 Play some tunes! 🎵")
                .font(.system(size: 60))
                .bold()
                .padding()
                .background(Color.black)
                .cornerRadius(18)
                .padding(.bottom, 150)
                            
            HStack(spacing: 100) {
                PianoOctaveView(
                    octaveName: "Octave 1",
                    notes: [.c1, .d1, .e1, .f1, .g1, .a1, .b1, .c2]
                )

                PianoOctaveView(
                    octaveName: "Octave 2",
                    notes: [.c3, .d2, .e2, .f2, .g2, .a2, .b2, .c4]
                )
            }
            .padding()
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
