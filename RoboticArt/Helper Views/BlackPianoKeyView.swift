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
                .fill(Color(.displayP3, red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 0.3))
                .roundedCorners(radius: 8, corners: [.bottomLeft, .bottomRight])
//                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 2)
        }
        .frame(width: keyWidth, height: keyHeight)
    }
}

struct BlackPianoKeyView_Previews: PreviewProvider {
    static var previews: some View {
        BlackPianoKeyView()
    }
}
