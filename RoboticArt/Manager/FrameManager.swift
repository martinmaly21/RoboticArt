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
    @Published var thumbFingerLocations: [CGPoint]?
    @Published var indexFingerLocations: [CGPoint]?
    @Published var middleFingerLocations: [CGPoint]?
    @Published var ringFingerLocations: [CGPoint]?
    @Published var littleFingerLocations: [CGPoint]?
    
    private let handPoseRequest: VNDetectHumanHandPoseRequest = {
      let request = VNDetectHumanHandPoseRequest()
      request.maximumHandCount = 1
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
              self.current = buffer
          }
      }
      
      let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])
      do {
          // Perform VNDetectHumanHandPoseRequest
          try handler.perform([handPoseRequest])
          // Continue only when a hand was detected in the frame.
          // Since we set the maximumHandCount property of the request to 1, there will be at most one observation.
          guard let observation = handPoseRequest.results?.first else {
              return
          }
          // Get points for index finger.
          let indexFingerPoints = try observation.recognizedPoints(.all)
          // Look for tip points.
          guard let thumb1 = indexFingerPoints[.thumbTip],
                let thumb2 = indexFingerPoints[.thumbIP],
                let thumb3 = indexFingerPoints[.thumbMP],
                let index1 = indexFingerPoints[.indexTip],
                let index2 = indexFingerPoints[.indexDIP],
                let index3 = indexFingerPoints[.indexPIP],
                let middle1 = indexFingerPoints[.middleTip],
                let middle2 = indexFingerPoints[.middleDIP],
                let middle3 = indexFingerPoints[.middlePIP],
                let ring1 = indexFingerPoints[.ringTip],
                let ring2 = indexFingerPoints[.ringDIP],
                let ring3 = indexFingerPoints[.ringPIP],
                let little1 = indexFingerPoints[.littleTip],
                let little2 = indexFingerPoints[.littleDIP],
                let little3 = indexFingerPoints[.littlePIP] else {
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
          
          thumbFingerLocations = [
            CGPoint(x: 1 - thumb1.location.x, y: 1 - thumb1.location.y),
            CGPoint(x: 1 - thumb2.location.x, y: 1 - thumb2.location.y),
            CGPoint(x: 1 - thumb3.location.x, y: 1 - thumb3.location.y),
          ]
          
          indexFingerLocations = [
            CGPoint(x: 1 - index1.location.x, y: 1 - index1.location.y),
            CGPoint(x: 1 - index2.location.x, y: 1 - index2.location.y),
            CGPoint(x: 1 - index3.location.x, y: 1 - index3.location.y),
          ]
          
          middleFingerLocations = [
            CGPoint(x: 1 - middle1.location.x, y: 1 - middle1.location.y),
            CGPoint(x: 1 - middle2.location.x, y: 1 - middle2.location.y),
            CGPoint(x: 1 - middle3.location.x, y: 1 - middle3.location.y),
          ]
          
          ringFingerLocations = [
            CGPoint(x: 1 - ring1.location.x, y: 1 - ring1.location.y),
            CGPoint(x: 1 - ring2.location.x, y: 1 - ring2.location.y),
            CGPoint(x: 1 - ring3.location.x, y: 1 - ring3.location.y),
          ]
          
          
          littleFingerLocations = [
            CGPoint(x: 1 - little1.location.x, y: 1 - little1.location.y),
            CGPoint(x: 1 - little2.location.x, y: 1 - little2.location.y),
            CGPoint(x: 1 - little3.location.x, y: 1 - little3.location.y),
          ]
          
      } catch {
          fatalError()
      }
  }
}
