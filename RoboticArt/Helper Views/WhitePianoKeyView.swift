//
//  WhitePianoKeyView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct WhitePianoKeyView: View {
    let noteType: NoteType
    let keyHeight: CGFloat = 450
    
    var keyWidth: CGFloat {
        return keyHeight / 5
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.white)
                .roundedCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
                .shadow(color: Color.black.opacity(0.7), radius: 5, x: 5, y: 5)
                
            VStack {
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.6))
                        .frame(width: keyWidth / 1.5)
                        
                    Text(noteType.parsedNote)
                        .font(.system(size: 20))
                        .bold()
                }
                .frame(width: keyWidth / 1.5, height: keyWidth / 1.5)
            }
            .padding(.bottom, 25)
        }
        .frame(width: keyWidth, height: keyHeight)
    }
}

struct PianoKeyView_Previews: PreviewProvider {
    static var previews: some View {
        WhitePianoKeyView(noteType: .a1)
    }
}
