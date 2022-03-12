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
    
    let whiteKeyHeight: CGFloat = 450
    var whiteKeyWidth: CGFloat {
        return whiteKeyHeight / 5
    }
    
    let spacing: CGFloat = 5
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(octaveName)
                .font(.system(size: 40))
                .bold()
            
            ZStack(alignment: .top) {
                HStack(spacing: spacing) {
                    ForEach(
                        notes,
                        id: \.self,
                        content: { note in
                            WhitePianoKeyView(
                                noteType: note,
                                keyHeight: whiteKeyHeight,
                                keyWidth: whiteKeyWidth
                            )
                        }
                    )
                    
                    Spacer()
                }
                
                //in future, calculate these offsets
                HStack {
                    
                    BlackPianoKeyView()
                        .padding(.leading, 68.25)
                    
                    BlackPianoKeyView()
                        .padding(.leading, 40)
                    
                    BlackPianoKeyView()
                        .padding(.leading, 135)
                    
                    BlackPianoKeyView()
                        .padding(.leading, 40)
                    
                    BlackPianoKeyView()
                        .padding(.leading, 40)
                    
                    Spacer()
                }
            }
        }
    }
}
