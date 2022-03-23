//
//  ModeView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI


struct ModeView: View {
    let modeTitle: String
    let modeImage: NSImage
    
    var body: some View {
        ZStack {
            Image(nsImage: modeImage)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Text(modeTitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        .bold()
                        .padding()
                        .background(.thickMaterial)
                        .cornerRadius(10)
                    
                    Spacer()
                }
                .padding([.bottom, .leading], 8)
            }
        }
        .frame(width: 600, height: 450)
        .background(Color.white)
        .cornerRadius(16)
        
    }
}

