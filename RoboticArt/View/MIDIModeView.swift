//
//  MIDIModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct MIDIModeView: View {
    @Binding var currentView: CurrentView
    @StateObject var serialPortViewModel = SerialPortViewModel()
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            TextField(
                    "Data to send arduino",
                    text: $messageText
                )
            
            Button(
                action: {
                    serialPortViewModel.sendData(messageText)
                },
                label: {
                    
                    Text("Send!")
                }
            )
        }
        .padding()
    }
}
