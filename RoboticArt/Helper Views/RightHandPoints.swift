//
//  RightHandPoints.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-23.
//

import SwiftUI

struct RightHandPoints: View {
    @EnvironmentObject var machineVisionViewModel: MachineVisionViewModel
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        Group {
            if let thumbFingerLocations = machineVisionViewModel.rightThumbFingerLocations {
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
            
            if let indexFingers = machineVisionViewModel.rightIndexFingerLocations {
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
            
            if let middleFingerLocations = machineVisionViewModel.rightMiddleFingerLocations {
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
            
            if let ringFingerLocations = machineVisionViewModel.rightRingFingerLocations {
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
            
            if let littleFingerLocations = machineVisionViewModel.rightLittleFingerLocations {
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
