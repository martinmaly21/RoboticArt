//
//  PianoOctaveView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct PianoOctaveView: View {
    let octaveName: String
    let notes: [NoteType]
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                Text(octaveName)
                    .font(.system(size: 40))
                    .bold()
                ZStack(alignment: .top) {
                    HStack(spacing: 5) {
                        ForEach(
                            notes,
                            id: \.self,
                            content: { note in
                                WhitePianoKeyView(noteType: note)
                            }
                        )
                    }
                    
                    //sharps and flats
                    HStack {
                        
                        BlackPianoKeyView()
                        
                        BlackPianoKeyView()
                        
                        BlackPianoKeyView()
                        
                        BlackPianoKeyView()
                        
                        BlackPianoKeyView()
                    }
                }
            }
        }
    }
}
