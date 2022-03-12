//
//  RoboticArtApp.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-08.
//

import SwiftUI
import ORSSerial

//Declare global ORSSerialPortManager that can be used throughout app
var manager = ORSSerialPortManager.shared()

@main
struct RoboticArtApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
