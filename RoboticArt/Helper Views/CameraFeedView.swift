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
//                    .resizable()
//                    .scaledToFill()
                    .frame(
                      width: geometry.size.width,
                      height: geometry.size.height,
                      alignment: .center)
//                    .clipped()
//                    .cornerRadius(20)

                  if let thumbFingerLocations = machineVisionViewModel.thumbFingerLocations {
                      ForEach(thumbFingerLocations, id: \.self) { fingerPoint in
                          Circle()
                              .frame(width: 10, height: 10)
                              .position(
                                x: fingerPoint.x * geometry.size.width,
                                y: fingerPoint.y * geometry.size.height
                              )
                      }
                  } else {
                      EmptyView()
                  }
                  
                  if let indexFingers = machineVisionViewModel.indexFingerLocations {
                      ForEach(indexFingers, id: \.self) { fingerPoint in
                          Circle()
                              .frame(width: 10, height: 10)
                              .position(
                                x: fingerPoint.x * geometry.size.width,
                                y: fingerPoint.y * geometry.size.height
                              )
                      }
                  } else {
                      EmptyView()
                  }
                  
                  if let middleFingerLocations = machineVisionViewModel.middleFingerLocations {
                      ForEach(middleFingerLocations, id: \.self) { fingerPoint in
                          Circle()
                              .frame(width: 10, height: 10)
                              .position(
                                x: fingerPoint.x * geometry.size.width,
                                y: fingerPoint.y * geometry.size.height
                              )
                      }
                  } else {
                      EmptyView()
                  }
                  
                  if let ringFingerLocations = machineVisionViewModel.ringFingerLocations {
                      ForEach(ringFingerLocations, id: \.self) { fingerPoint in
                          Circle()
                              .frame(width: 10, height: 10)
                              .position(
                                x: fingerPoint.x * geometry.size.width,
                                y: fingerPoint.y * geometry.size.height
                              )
                      }
                  } else {
                      EmptyView()
                  }
                  
                  if let littleFingerLocations = machineVisionViewModel.littleFingerLocations {
                      ForEach(littleFingerLocations, id: \.self) { fingerPoint in
                          Circle()
                              .frame(width: 10, height: 10)
                              .position(
                                x: fingerPoint.x * geometry.size.width,
                                y: fingerPoint.y * geometry.size.height
                              )
                      }
                  } else {
                      EmptyView()
                  }
              }
          }
        } else {
          Color.clear
        }
    }
}
