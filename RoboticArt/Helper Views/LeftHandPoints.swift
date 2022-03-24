//
//  LeftHandPoints.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-23.
//

import SwiftUI

struct LeftHandPoints: View {
    @EnvironmentObject var machineVisionViewModel: MachineVisionViewModel
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Group {
            if let thumbFingerLocations = machineVisionViewModel.leftThumbFingerLocations {
                ForEach(thumbFingerLocations, id: \.self) { fingerPoint in
                    Circle()
                        .fill(Color.red)
                        .frame(width: 25, height: 25)
                        .position(
                            x: fingerPoint.x * width,
                            y: fingerPoint.y * height
                        )
                }
            } else {
                EmptyView()
            }
            
            if let indexFingers = machineVisionViewModel.leftIndexFingerLocations {
                ForEach(indexFingers, id: \.self) { fingerPoint in
                    Circle()
                        .fill(Color.green)
                        .frame(width: 25, height: 25)
                        .position(
                            x: fingerPoint.x * width,
                            y: fingerPoint.y * height
                        )
                }
            } else {
                EmptyView()
            }
            
            if let middleFingerLocations = machineVisionViewModel.leftMiddleFingerLocations {
                ForEach(middleFingerLocations, id: \.self) { fingerPoint in
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                        .position(
                            x: fingerPoint.x * width,
                            y: fingerPoint.y * height
                        )
                }
            } else {
                EmptyView()
            }
            
            if let ringFingerLocations = machineVisionViewModel.leftRingFingerLocations {
                ForEach(ringFingerLocations, id: \.self) { fingerPoint in
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 25, height: 25)
                        .position(
                            x: fingerPoint.x * width,
                            y: fingerPoint.y * height
                        )
                }
            } else {
                EmptyView()
            }
            
            if let littleFingerLocations = machineVisionViewModel.leftLittleFingerLocations {
                ForEach(littleFingerLocations, id: \.self) { fingerPoint in
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 25, height: 25)
                        .position(
                            x: fingerPoint.x * width,
                            y: fingerPoint.y * height
                        )
                }
            } else {
                EmptyView()
            }
        }
    }
}
