//
//  BlackPianoKeyView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct BlackPianoKeyView: View {
    let keyHeight: CGFloat = 330
    
    var keyWidth: CGFloat {
        return keyHeight / 7
    }
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .roundedCorners(radius: 20, corners: [.bottomLeft, .bottomRight])
                .shadow(color: Color.black.opacity(0.7), radius: 5, x: 5, y: 5)
        }
        .frame(width: keyWidth, height: keyHeight)
    }
}

struct BlackPianoKeyView_Previews: PreviewProvider {
    static var previews: some View {
        BlackPianoKeyView()
    }
}
