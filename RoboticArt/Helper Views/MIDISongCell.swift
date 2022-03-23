//
//  MIDISongCell.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-22.
//

import SwiftUI

struct MIDISongCell: View {
    let song: Song
    
    var body: some View {
        HStack {
            Image(
                nsImage: song.image
            )
                .cornerRadius(8)
                .padding(.trailing, 12)
            
            VStack(alignment: .leading) {
                Text(song.name)
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.black)
                
                Text(song.artist)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(Color.white)
        .cornerRadius(20)
    }
}
