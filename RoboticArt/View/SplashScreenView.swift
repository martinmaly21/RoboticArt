//
//  SplashScreenView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @Binding var currentView: CurrentView
    
    @State private var hasPlayedGlissando = false
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Text("Welcome to Robotic Art!")
                    .font(.system(size: 60))
                    .bold()
                
                Text("An ELEC 490 project designed by Nicholas Alderman, Drew Anderson, Carter Jan, Martin Maly, and Charlie Maslenchko")
                    .font(.system(size: 25))
                
                Spacer()
                    .frame(height: 100)
                
                
                CirclePulseButton(
                    color: .mint,
                    text: "👌 to begin",
                    buttonDimension: 250,
                    numberOfOuterCircles: 15,
                    animationDuration: 1
                )
                    .onTapGesture {
                        guard hasPlayedGlissando else {
                            hasPlayedGlissando.toggle()
                            Task {
                                await glissando()
                            }
                            
                            return
                        }
                        
                        withAnimation {
                            currentView = .information
                        }
                    }
            }
    
        }
        .padding(.top, 300)
        
        
        Spacer()
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
    
    func playNote(noteType: NoteType, for seconds: Double) async {
        serialPortViewModel.sendData(noteType.binaryNote)
        await Task.sleep(seconds: seconds)
    }
    
}
