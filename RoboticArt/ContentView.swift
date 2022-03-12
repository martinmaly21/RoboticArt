//
//  ContentView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-08.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
