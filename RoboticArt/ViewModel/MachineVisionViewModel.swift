//
//  MachineVisionViewModel.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-13.
//

import CoreImage

class MachineVisionViewModel: ObservableObject {
    @Published var frame: CGImage?
    @Published var indexFingerLocations: [CGPoint]?
    
    private let frameManager = FrameManager.shared
    
    init() {
        setupSubscriptions()
    }
    
    func setupSubscriptions() {
        frameManager.$current
            .receive(on: RunLoop.main)
            .compactMap { buffer in
                return CGImage.create(from: buffer)
            }
            .assign(to: &$frame)
        
        
        frameManager.$indexFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$indexFingerLocations)
    }
}
