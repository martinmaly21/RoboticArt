//
//  CameraFeedView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-13.
//

import SwiftUI

struct CameraFeedView: View {
    @EnvironmentObject var serialPortViewModel: SerialPortViewModel
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
                .onChange(
                    of: machineVisionViewModel.frame,
                    perform: { _ in
                        var notesToPlay = [NoteType]()
                        
                        //MARK: - left hand
                        if let tip =  machineVisionViewModel.leftThumbFingerLocations?.first,
                           let bottom = machineVisionViewModel.leftThumbFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        //left index
                        if let tip =  machineVisionViewModel.leftIndexFingerLocations?.first,
                           let bottom = machineVisionViewModel.leftIndexFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        if let tip =  machineVisionViewModel.leftMiddleFingerLocations?.first,
                           let bottom = machineVisionViewModel.leftMiddleFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        if let tip =  machineVisionViewModel.leftRingFingerLocations?.first,
                           let bottom = machineVisionViewModel.leftRingFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        if let tip =  machineVisionViewModel.leftLittleFingerLocations?.first,
                           let bottom = machineVisionViewModel.leftLittleFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        //MARK: - right hand
                        if let tip =  machineVisionViewModel.rightThumbFingerLocations?.first,
                           let bottom = machineVisionViewModel.rightThumbFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        //left index
                        if let tip =  machineVisionViewModel.rightIndexFingerLocations?.first,
                           let bottom = machineVisionViewModel.rightIndexFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        if let tip =  machineVisionViewModel.rightMiddleFingerLocations?.first,
                           let bottom = machineVisionViewModel.rightMiddleFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        if let tip =  machineVisionViewModel.rightRingFingerLocations?.first,
                           let bottom = machineVisionViewModel.rightRingFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        if let tip =  machineVisionViewModel.rightLittleFingerLocations?.first,
                           let bottom = machineVisionViewModel.rightLittleFingerLocations?.last {
                            
                            //AND tip is over any key, then add that key to notesToPlay
                            if tip.y > bottom.y, let note = getNote(for: CGPoint(x: tip.x * geometry.size.width, y: tip.y * geometry.size.height))  {
                                notesToPlay.append(note)
                            }
                        }
                        
                        playNote(noteType: notesToPlay)
                    }
                )
            }
        } else {
            Color.clear
        }
    }
    
    
    func getNote(for point: CGPoint) -> NoteType? {
        for noteType in NoteType.allCases {
            if noteType.correspondingRect.contains(point) {
                return noteType
            }
        }
        
        return nil
    }
    
    func playNote(noteType: [NoteType]) {
        let convertedBinary: [UInt16] = noteType.compactMap { UInt16($0.binaryNote, radix: 2) }
        
        var intermediateResult: UInt16 = 0
        convertedBinary.forEach { intermediateResult = intermediateResult | $0 }
        
        let currentNote = String(intermediateResult, radix: 2).pad(toSize: 16)
        
        serialPortViewModel.sendData(currentNote)
    }
}
