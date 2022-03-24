//
//  MachineVisionViewModel.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-13.
//

import CoreImage

class MachineVisionViewModel: ObservableObject {
    @Published var frame: CGImage?
    
    @Published var thumbFingerLocations: [CGPoint]?
    @Published var indexFingerLocations: [CGPoint]?
    @Published var middleFingerLocations: [CGPoint]?
    @Published var ringFingerLocations: [CGPoint]?
    @Published var littleFingerLocations: [CGPoint]?
    
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
        
        
        frameManager.$thumbFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$thumbFingerLocations)
        
        frameManager.$indexFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$indexFingerLocations)
        
        frameManager.$middleFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$middleFingerLocations)
        
        frameManager.$ringFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$ringFingerLocations)
        
        frameManager.$littleFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$littleFingerLocations)
    }
}
