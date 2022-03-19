//
//  CameraFeedView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-13.
//

import SwiftUI

struct CameraFeedView: View {
    var image: CGImage?
    var indexTip: CGPoint?
    private let label = Text("Camera feed")
    
    var body: some View {
        if let image = image {
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
                  if let indexTip = indexTip {
                      Text("Point is: \(indexTip.debugDescription)")
                          .foregroundColor(.white)
                          .background(Color.red)
                  }
              }
            
          }
        } else {
          Color.clear
        }
    }
}
