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
    @Published var indexFingerLocations: [CGPoint]?
    
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
          let indexFingerPoints = try observation.recognizedPoints(.indexFinger)
          // Look for tip points.
          guard let index1 = indexFingerPoints[.indexTip],
                let index2 = indexFingerPoints[.indexDIP],
                let index3 = indexFingerPoints[.indexPIP],
                let index4 = indexFingerPoints[.indexMCP] else {
                    return
                }
          // Ignore low confidence points.
          guard index1.confidence > 0.3,
                index2.confidence > 0.3,
                index3.confidence > 0.3,
                index4.confidence > 0.3 else {
                    return
                }
          
          indexFingerLocations = [
            CGPoint(x: index1.location.x, y: 1 - index1.location.y),
            CGPoint(x: index2.location.x, y: 1 - index2.location.y),
            CGPoint(x: index3.location.x, y: 1 - index3.location.y),
            CGPoint(x: index4.location.x, y: 1 - index4.location.y)
          ]
      } catch {
          fatalError()
      }
  }
}
