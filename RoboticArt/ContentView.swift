//
//  ContentView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                //Connect to serial port
                print("Connecting to serial port")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
