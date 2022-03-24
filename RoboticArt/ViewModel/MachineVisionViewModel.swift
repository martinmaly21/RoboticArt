//
//  MachineVisionViewModel.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-13.
//

import CoreImage

class MachineVisionViewModel: ObservableObject {
    @Published var frame: CGImage?
    
    @Published var leftThumbFingerLocations: [CGPoint]?
    @Published var leftIndexFingerLocations: [CGPoint]?
    @Published var leftMiddleFingerLocations: [CGPoint]?
    @Published var leftRingFingerLocations: [CGPoint]?
    @Published var leftLittleFingerLocations: [CGPoint]?
    
    @Published var rightThumbFingerLocations: [CGPoint]?
    @Published var rightIndexFingerLocations: [CGPoint]?
    @Published var rightMiddleFingerLocations: [CGPoint]?
    @Published var rightRingFingerLocations: [CGPoint]?
    @Published var rightLittleFingerLocations: [CGPoint]?
    
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
        
        
        //left hand
        frameManager.$leftThumbFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$leftThumbFingerLocations)
        
        frameManager.$leftIndexFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$leftIndexFingerLocations)
        
        frameManager.$leftMiddleFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$leftMiddleFingerLocations)
        
        frameManager.$leftRingFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$leftRingFingerLocations)
        
        frameManager.$leftLittleFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$leftLittleFingerLocations)
        
        
        //right hand
        frameManager.$rightThumbFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$rightThumbFingerLocations)
        
        frameManager.$rightIndexFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$rightIndexFingerLocations)
        
        frameManager.$rightMiddleFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$rightMiddleFingerLocations)
        
        frameManager.$rightRingFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$rightRingFingerLocations)
        
        frameManager.$rightLittleFingerLocations
            .receive(on: RunLoop.main)
            .compactMap { value in
                return value
            }
            .assign(to: &$rightLittleFingerLocations)
    }
}
