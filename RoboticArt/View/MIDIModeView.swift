//
//  MIDIModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct MIDIModeView: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @Binding var currentView: CurrentView
    @State var messageText: String = ""
    
    let songs: [Song] = [
        Song(
            name: "Drunken Sailor",
            artist: "Irish Rovers",
            image: NSImage(named: "DrunkenSailor")!
        ),
        
        Song(
            name: "Twinkle Twinkle Little Star",
            artist: "Nursery Rhyme",
            image: NSImage(named: "Twinkle")!
        ),
    
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Choose song to play!")
                .font(.system(size: 60))
                .bold()
                .padding(40)
            
            ForEach(
                songs,
                id: \.self,
                content: { song in
                    MIDISongCell(song: song)
                        .onTapGesture {
                            Task {
                                withAnimation {
                                    currentView = .midiModePiano(song: song)
                                }
                            }
                        }
                }
            )
            
            Spacer()
        }
        .padding()
    }
}
