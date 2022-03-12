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
        
        VStack {
            Text(octaveName)
                .font(.system(size: 40))
                .bold()
            
            HStack(spacing: 5) {
                ForEach(
                    notes,
                    id: \.self,
                    content: { note in
                        PianoKeyView(noteType: note)
                    }
                )
            }
        }
    }
}
