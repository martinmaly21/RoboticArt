//
//  PianoView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-08.
//

import SwiftUI

struct PianoView: View {
    @StateObject var serialPortViewModel = SerialPortViewModel()
    
    var body: some View {
        HStack {
            HStack {
                ForEach(
                    Range(0...7),
                    content: { _ in
                        PianoKeyView()
                    }
                )
            }
            HStack {
                ForEach(
                    Range(0...7),
                    content: { _ in
                        PianoKeyView()
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PianoView()
    }
}
