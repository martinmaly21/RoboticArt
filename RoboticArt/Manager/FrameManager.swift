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
    @Published var indexTipLocation: CGPoint?
    
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
          guard let indexTipPoint = indexFingerPoints[.indexTip] else {
              return
          }
          // Ignore low confidence points.
          guard indexTipPoint.confidence > 0.3 else {
              return
          }
          
          indexTipLocation = CGPoint(x: indexTipPoint.location.x, y: 1 - indexTipPoint.location.y)
      } catch {
          fatalError()
      }
  }
}
