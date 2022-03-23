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
                    
                    Button(
                        action: {
                            serialPortViewModel.sendData("1000000000000000")
                        },
                        label: {
                            Text("1 Key")
                                .frame(width: 200, height: 100)
                                .font(.system(size: 25))
                                .background(.thickMaterial)
                                .cornerRadius(20)
                        }
                    )
                    
                    Button(
                        action: {
                            serialPortViewModel.sendData("1100000000000000")
                        },
                        label: {
                            Text("2 Keys")
                                .frame(width: 200, height: 100)
                                .font(.system(size: 25))
                                .background(.thickMaterial)
                                .cornerRadius(20)
                        }
                    )
                    
                    Button(
                        action: {
                            serialPortViewModel.sendData("1110000000000000")
                        },
                        label: {
                            Text("3 Keys")
                                .frame(width: 200, height: 100)
                                .font(.system(size: 25))
                                .background(.thickMaterial)
                                .cornerRadius(20)
                        }
                    )
                    
                    Button(
                        action: {
                            serialPortViewModel.sendData("1111000000000000")
                        },
                        label: {
                            Text("4 Keys")
                                .frame(width: 200, height: 100)
                                .font(.system(size: 25))
                                .background(.thickMaterial)
                                .cornerRadius(20)
                        }
                    )
                }
                
                CirclePulseButton(
                    color: .mint,
                    text: "👌 to continue",
                    buttonDimension: 250,
                    numberOfOuterCircles: 15,
                    animationDuration: 1
                )
                    .onTapGesture {
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
