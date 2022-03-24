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
                    Image(image, scale: 1.15, orientation: .upMirrored, label: label)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .center
                        )
                    
                    LeftHandPoints(width: geometry.size.width, height: geometry.size.height)
                    RightHandPoints(width: geometry.size.width, height: geometry.size.height)
                }
            }
        } else {
            Color.clear
        }
    }
}
