//
//  FrameManager.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-13.
//

import AVFoundation
import Vision

class FrameManager: NSObject, ObservableObject {
    static let shared = FrameManager()
    
    @Published var current: CVPixelBuffer?
    
    //fingers
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
    
    private let handPoseRequest: VNDetectHumanHandPoseRequest = {
        let request = VNDetectHumanHandPoseRequest()
        request.maximumHandCount = 2
        return request
    }()
    
    
    let videoOutputQueue = DispatchQueue(
        label: "com.martinmaly.RoboticArt",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem)
    
    private override init() {
        super.init()
        CameraManager.shared.set(self, queue: videoOutputQueue)
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        if let buffer = sampleBuffer.imageBuffer {
            DispatchQueue.main.async {
                let imaghe = CIImage(cvImageBuffer: buffer)
                print("Fuck: \(imaghe.extent)")
                self.current = buffer
            }
        }
        
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])
        do {
            // Perform VNDetectHumanHandPoseRequest
            try handler.perform([handPoseRequest])
            // Continue only when a hand was detected in the frame.
            // Since we set the maximumHandCount property of the request to 1, there will be at most one observation.
            if let leftHandObservation = handPoseRequest.results?.first {
                // Get points for index finger.
                let recognizedPoints = try leftHandObservation.recognizedPoints(.all)
                
                guard let thumb1 = recognizedPoints[.thumbTip],
                      let thumb2 = recognizedPoints[.thumbIP],
                      let thumb3 = recognizedPoints[.thumbMP],
                      let index1 = recognizedPoints[.indexTip],
                      let index2 = recognizedPoints[.indexDIP],
                      let index3 = recognizedPoints[.indexPIP],
                      let middle1 = recognizedPoints[.middleTip],
                      let middle2 = recognizedPoints[.middleDIP],
                      let middle3 = recognizedPoints[.middlePIP],
                      let ring1 = recognizedPoints[.ringTip],
                      let ring2 = recognizedPoints[.ringDIP],
                      let ring3 = recognizedPoints[.ringPIP],
                      let little1 = recognizedPoints[.littleTip],
                      let little2 = recognizedPoints[.littleDIP],
                      let little3 = recognizedPoints[.littlePIP] else {
                          return
                      }
                // Ignore low confidence points.
                guard thumb1.confidence > 0.3,
                      thumb2.confidence > 0.3,
                      thumb3.confidence > 0.3,
                      index1.confidence > 0.3,
                      index2.confidence > 0.3,
                      index3.confidence > 0.3,
                      middle1.confidence > 0.3,
                      middle2.confidence > 0.3,
                      middle3.confidence > 0.3,
                      ring1.confidence > 0.3,
                      ring2.confidence > 0.3,
                      ring3.confidence > 0.3,
                      little1.confidence > 0.3,
                      little2.confidence > 0.3,
                      little3.confidence > 0.3
                else {
                    return
                }
                
                leftThumbFingerLocations = [
                    CGPoint(x: 1 - thumb1.location.x, y: 1 - thumb1.location.y),
                    CGPoint(x: 1 - thumb2.location.x, y: 1 - thumb2.location.y),
                    CGPoint(x: 1 - thumb3.location.x, y: 1 - thumb3.location.y),
                ]
                
                leftIndexFingerLocations = [
                    CGPoint(x: 1 - index1.location.x, y: 1 - index1.location.y),
                    CGPoint(x: 1 - index2.location.x, y: 1 - index2.location.y),
                    CGPoint(x: 1 - index3.location.x, y: 1 - index3.location.y),
                ]
                
                leftMiddleFingerLocations = [
                    CGPoint(x: 1 - middle1.location.x, y: 1 - middle1.location.y),
                    CGPoint(x: 1 - middle2.location.x, y: 1 - middle2.location.y),
                    CGPoint(x: 1 - middle3.location.x, y: 1 - middle3.location.y),
                ]
                
                leftRingFingerLocations = [
                    CGPoint(x: 1 - ring1.location.x, y: 1 - ring1.location.y),
                    CGPoint(x: 1 - ring2.location.x, y: 1 - ring2.location.y),
                    CGPoint(x: 1 - ring3.location.x, y: 1 - ring3.location.y),
                ]
                
                leftLittleFingerLocations = [
                    CGPoint(x: 1 - little1.location.x, y: 1 - little1.location.y),
                    CGPoint(x: 1 - little2.location.x, y: 1 - little2.location.y),
                    CGPoint(x: 1 - little3.location.x, y: 1 - little3.location.y),
                ]
            }
            
            if let leftHandObservation = handPoseRequest.results?.last {
                let recognizedPoints = try leftHandObservation.recognizedPoints(.all)
                guard let thumb1 = recognizedPoints[.thumbTip],
                      let thumb2 = recognizedPoints[.thumbIP],
                      let thumb3 = recognizedPoints[.thumbMP],
                      let index1 = recognizedPoints[.indexTip],
                      let index2 = recognizedPoints[.indexDIP],
                      let index3 = recognizedPoints[.indexPIP],
                      let middle1 = recognizedPoints[.middleTip],
                      let middle2 = recognizedPoints[.middleDIP],
                      let middle3 = recognizedPoints[.middlePIP],
                      let ring1 = recognizedPoints[.ringTip],
                      let ring2 = recognizedPoints[.ringDIP],
                      let ring3 = recognizedPoints[.ringPIP],
                      let little1 = recognizedPoints[.littleTip],
                      let little2 = recognizedPoints[.littleDIP],
                      let little3 = recognizedPoints[.littlePIP] else {
                          return
                      }
                // Ignore low confidence points.
                guard thumb1.confidence > 0.3,
                      thumb2.confidence > 0.3,
                      thumb3.confidence > 0.3,
                      index1.confidence > 0.3,
                      index2.confidence > 0.3,
                      index3.confidence > 0.3,
                      middle1.confidence > 0.3,
                      middle2.confidence > 0.3,
                      middle3.confidence > 0.3,
                      ring1.confidence > 0.3,
                      ring2.confidence > 0.3,
                      ring3.confidence > 0.3,
                      little1.confidence > 0.3,
                      little2.confidence > 0.3,
                      little3.confidence > 0.3
                else {
                    return
                }
                
                rightThumbFingerLocations = [
                    CGPoint(x: 1 - thumb1.location.x, y: 1 - thumb1.location.y),
                    CGPoint(x: 1 - thumb2.location.x, y: 1 - thumb2.location.y),
                    CGPoint(x: 1 - thumb3.location.x, y: 1 - thumb3.location.y),
                ]
                
                rightIndexFingerLocations = [
                    CGPoint(x: 1 - index1.location.x, y: 1 - index1.location.y),
                    CGPoint(x: 1 - index2.location.x, y: 1 - index2.location.y),
                    CGPoint(x: 1 - index3.location.x, y: 1 - index3.location.y),
                ]
                
                rightMiddleFingerLocations = [
                    CGPoint(x: 1 - middle1.location.x, y: 1 - middle1.location.y),
                    CGPoint(x: 1 - middle2.location.x, y: 1 - middle2.location.y),
                    CGPoint(x: 1 - middle3.location.x, y: 1 - middle3.location.y),
                ]
                
                rightRingFingerLocations = [
                    CGPoint(x: 1 - ring1.location.x, y: 1 - ring1.location.y),
                    CGPoint(x: 1 - ring2.location.x, y: 1 - ring2.location.y),
                    CGPoint(x: 1 - ring3.location.x, y: 1 - ring3.location.y),
                ]
                
                rightLittleFingerLocations = [
                    CGPoint(x: 1 - little1.location.x, y: 1 - little1.location.y),
                    CGPoint(x: 1 - little2.location.x, y: 1 - little2.location.y),
                    CGPoint(x: 1 - little3.location.x, y: 1 - little3.location.y),
                ]
            }
        } catch {
            fatalError()
        }
    }
}
