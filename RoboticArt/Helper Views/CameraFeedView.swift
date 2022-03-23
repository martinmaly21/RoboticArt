//
//  CameraFeedView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-13.
//

import SwiftUI

struct CameraFeedView: View {
    @EnvironmentObject var machineVisionViewModel: MachineVisionViewModel
    private let label = Text("Camera feed")
    
    var body: some View {
        if let image = machineVisionViewModel.frame {
          GeometryReader { geometry in
              ZStack {
                  Image(image, scale: 1.0, orientation: .upMirrored, label: label)
                    .resizable()
                    .scaledToFill()
                    .frame(
                      width: geometry.size.width,
                      height: geometry.size.height,
                      alignment: .center)
                    .clipped()
                    .cornerRadius(20)
                  
                  //TODO:
                  if let indexTip = machineVisionViewModel.indexTipLocation {
                      Circle()
                          .frame(width: 20, height: 20)
                      
                          .position(
                            x: geometry.size.width - (indexTip.x * geometry.size.width),
                            y: indexTip.y * geometry.size.height
                          )
                  }
              }
            
          }
        } else {
          Color.clear
        }
    }
}
