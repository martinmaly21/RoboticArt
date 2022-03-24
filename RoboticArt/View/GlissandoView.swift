//
//  GlissandoView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-23.
//

import SwiftUI

struct GlissandoView: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @Binding var currentView: CurrentView
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Text("Edbot also likes to show off!")
                    .font(.system(size: 60))
                    .bold()
                
                Text("A glissando is a glide from one pitch to another.")
                    .font(.system(size: 25))
                
                Spacer()
                    .frame(height: 100)
                
                Text("Tap to glissando!")
                    .frame(width: 200, height: 100)
                    .font(.system(size: 25))
                    .background(.thickMaterial)
                    .cornerRadius(20)
                    .onTapGesture {
                        Task {
                            await glissando()
                        }
                    }
                
                
                CirclePulseButton(
                    color: .mint,
                    text: "👌 to continue",
                    buttonDimension: 250,
                    numberOfOuterCircles: 15,
                    animationDuration: 1
                )
                    .onTapGesture {
                        Task {
                            withAnimation {
                                currentView = .chooseMode
                            }
                        }
                    }
            }
    
        }
        .padding(.top, 300)
        
        
        Spacer()
    }
    
    func playNote(noteType: NoteType, for seconds: Double) async {
        serialPortViewModel.sendData(noteType.binaryNote)
        await Task.sleep(seconds: seconds)
    }
    
    func glissando() async {
        let timeForEachNote = 0.1
        
        //up
        await playNote(noteType: .c1, for: timeForEachNote)
        await playNote(noteType: .d1, for: timeForEachNote)
        await playNote(noteType: .e1, for: timeForEachNote)
        await playNote(noteType: .f1, for: timeForEachNote)
        await playNote(noteType: .g1, for: timeForEachNote)
        await playNote(noteType: .a1, for: timeForEachNote)
        await playNote(noteType: .b1, for: timeForEachNote)
        await playNote(noteType: .c2, for: timeForEachNote)
        
        await playNote(noteType: .c3, for: timeForEachNote)
        await playNote(noteType: .d2, for: timeForEachNote)
        await playNote(noteType: .e2, for: timeForEachNote)
        await playNote(noteType: .f2, for: timeForEachNote)
        await playNote(noteType: .g2, for: timeForEachNote)
        await playNote(noteType: .a2, for: timeForEachNote)
        await playNote(noteType: .b2, for: timeForEachNote)
        await playNote(noteType: .c4, for: timeForEachNote)
        
        //down
        await playNote(noteType: .c4, for: timeForEachNote)
        await playNote(noteType: .b2, for: timeForEachNote)
        await playNote(noteType: .a2, for: timeForEachNote)
        await playNote(noteType: .g2, for: timeForEachNote)
        await playNote(noteType: .f2, for: timeForEachNote)
        await playNote(noteType: .e2, for: timeForEachNote)
        await playNote(noteType: .d2, for: timeForEachNote)
        await playNote(noteType: .c3, for: timeForEachNote)
        
        await playNote(noteType: .c2, for: timeForEachNote)
        await playNote(noteType: .b1, for: timeForEachNote)
        await playNote(noteType: .a1, for: timeForEachNote)
        await playNote(noteType: .g1, for: timeForEachNote)
        await playNote(noteType: .f1, for: timeForEachNote)
        await playNote(noteType: .e1, for: timeForEachNote)
        await playNote(noteType: .d1, for: timeForEachNote)
        await playNote(noteType: .c1, for: timeForEachNote)
        
        await playNote(noteType: .off, for: timeForEachNote)
    }
}
