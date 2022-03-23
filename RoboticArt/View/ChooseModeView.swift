//
//  ChooseModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI

struct ChooseModeView: View {
    @Binding var currentView: CurrentView
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Text("Choose how you'd like to interact with Edbot!")
                    .font(.system(size: 60))
                    .bold()
                    .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    ModeView(
                        modeTitle: "Computer Vision 👀",
                        modeImage: NSImage(named: "HandImage")!
                    )
                        .onTapGesture {
                            withAnimation {
                                currentView = .machineVisionMode
                            }
                        }
                    
                    ModeView(
                        modeTitle: "Play song 🎹",
                        modeImage: NSImage(named: "SheetMusic")!
                    )
                        .onTapGesture {
                            withAnimation {
                                currentView = .chooseSong
                            }
                        }
                }
                
                Spacer()
                    .frame(height: 100)
            }
            
        }
        .padding(.top, 200)
        
        Spacer()
    }
}
