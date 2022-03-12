//
//  MIDIModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct MIDIModeView: View {
    @Binding var currentView: CurrentView
    
    var body: some View {
        PianoView()
    }
}
