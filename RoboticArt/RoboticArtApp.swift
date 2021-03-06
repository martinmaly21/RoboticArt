//
//  RoboticArtApp.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-08.
//

import SwiftUI
import ORSSerial

@main
struct RoboticArtApp: App {
    @StateObject var serialPortViewModel = SerialPortViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(serialPortViewModel)
                .onAppear {
                    DispatchQueue.main.asyncAfter(
                        deadline: .now() + 0.3,
                        execute: {
                            if let window = NSApplication.shared.windows.last {
                                window.toggleFullScreen(nil)
                            }
                        }
                    )
                }
        }
    }
}
