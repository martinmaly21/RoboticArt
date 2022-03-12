//
//  ModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI


struct ModeView: View {
    let modeTitle: String
    let modeImage: NSImage?
    
    var body: some View {
        Text(modeTitle)
            .padding()
            .border(Color.red, width: 4)
            .cornerRadius(10)
    }
}

