//
//  WhitePianoKeyView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct WhitePianoKeyView: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel

    let noteType: NoteType
    let keyHeight: CGFloat
    let keyWidth: CGFloat
    
    private var isBeingPlayed: Bool  {
        return serialPortViewModel.currentPlayedNotes.contains(noteType)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .background(Color.white)
                    .roundedCorners(radius: 14, corners: [.bottomLeft, .bottomRight])
                    .shadow(color: Color.black.opacity(0.7), radius: 5, x: 5, y: 5)
                    .opacity(0.3)
                    
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
        }
        .background(isBeingPlayed ? Color.green : Color.clear)
        .roundedCorners(radius: 14, corners: [.bottomLeft, .bottomRight])
        .frame(width: keyWidth, height: keyHeight)
        .onTapGesture {
            serialPortViewModel.sendData(noteType.binaryNote)
        }
    }
}
