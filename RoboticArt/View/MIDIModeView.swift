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
        
        Song(
            name: "Mary Had a Little Lamb",
            artist: "Nursery Rhyme",
            image: NSImage(named: "lamb")!
        ),
        
        Song(
            name: "Superman",
            artist: "John Williams",
            image: NSImage(named: "superman")!
        ),
        
        Song(
            name: "Sweet but Psycho",
            artist: "Ava Max",
            image: NSImage(named: "psycho")!
        ),
        
        Song(
            name: "Jingle Bells",
            artist: "Santa",
            image: NSImage(named: "JingleBells")!
        ),

        
        Song(
            name: "Row Row Your Boat",
            artist: "Nursery Rhyme",
            image: NSImage(named: "boat")!
        ),
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 25, height: 40)
                    .foregroundColor(Color.white)
                
                Text("Back")
                    .aspectRatio(contentMode: .fill)
                    .font(.system(size: 30))
                    .frame(width: 150, height: 40)
                    .padding(.leading, -20)
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    currentView = .chooseMode
                }
            }
            Text("Choose song to play!")
                .font(.system(size: 60))
                .bold()
                .padding(40)
            
            ScrollView {
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
            }
            
            
            Spacer()
        }
        .padding()
    }
}
