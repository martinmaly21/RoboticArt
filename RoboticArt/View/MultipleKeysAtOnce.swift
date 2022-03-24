//
//  MultipleKeysAtOnce.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-23.
//

import SwiftUI

struct MultipleKeysAtOnce: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
    
    @Binding var currentView: CurrentView
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Text("Edbot can also play multiple keys at once")
                    .font(.system(size: 60))
                    .bold()
                
                Text("Edbot can play up to 4 keys at once")
                    .font(.system(size: 25))
                
                Spacer()
                    .frame(height: 100)
                
                
                HStack(spacing: 30) {
                    
                    Text("1 Key")
                        .frame(width: 200, height: 100)
                        .font(.system(size: 25))
                        .background(.thickMaterial)
                        .cornerRadius(20)
                        .onTapGesture {
                            serialPortViewModel.sendData("1000000000000000")
                        }
                    
                    Text("2 Keys")
                        .frame(width: 200, height: 100)
                        .font(.system(size: 25))
                        .background(.thickMaterial)
                        .cornerRadius(20)
                        .onTapGesture {
                            serialPortViewModel.sendData("1000000010000000")
                        }
                    
                    Text("3 Keys")
                        .frame(width: 200, height: 100)
                        .font(.system(size: 25))
                        .background(.thickMaterial)
                        .cornerRadius(20)
                        .onTapGesture {
                            serialPortViewModel.sendData("110000001000000")
                        }
                    
                    Text("4 Keys")
                        .frame(width: 200, height: 100)
                        .font(.system(size: 25))
                        .background(.thickMaterial)
                        .cornerRadius(20)
                        .onTapGesture {
                            serialPortViewModel.sendData("110000001100000")
                        }
                }
                
                CirclePulseButton(
                    color: .mint,
                    text: "👌 to continue",
                    buttonDimension: 250,
                    numberOfOuterCircles: 15,
                    animationDuration: 1
                )
                    .onTapGesture {
                        serialPortViewModel.sendData(NoteType.off.binaryNote)
                        
                        withAnimation {
                            currentView = .swipingAcrossKeyboardDemo
                        }
                    }
            }
    
        }
        .padding(.top, 300)
        
        
        Spacer()
    }
}
