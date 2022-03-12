//
//  SerialPortViewModel.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI
import ORSSerial


class SerialPortViewModel: NSObject, ObservableObject {
    //Declare global ORSSerialPortManager that can be used throughout app
    var manager = ORSSerialPortManager.shared()
    
    let port: ORSSerialPort
    
    override init() {
        guard let arduinoPort = manager.availablePorts.first(where: { $0.name.contains("usbmodem")}) else {
            fatalError("Could not get arduino port")
        }
        
        self.port = arduinoPort
        
        super.init()
        
        setUpPort()
    }


    private func setUpPort() {
        port.baudRate = 9600
        port.delegate = self
        port.open()
    }
    
    func sendData(_ string: String) {
        guard let dataToSend = "\(string)\n".data(using: .utf8) else {
            fatalError("Could not synthesize message to send")
        }
        
        port.send(dataToSend)
    }
}

extension SerialPortViewModel: ORSSerialPortDelegate {
     func serialPortWasOpened(_ serialPort: ORSSerialPort) {
         print("serialPortWasOpened")
     }
     func serialPort(_ serialPort: ORSSerialPort, didReceive data: Data) {
         print("didReceive")
     }
     
     func serialPort(_ serialPort: ORSSerialPort, didEncounterError error: Error) {
         print("didEncounterError: \(error)")
     }
     
     func serialPortWasClosed(_ serialPort: ORSSerialPort) {
         print("serialPortWasClosed")
     }
     
     func serialPortWasRemovedFromSystem(_ serialPort: ORSSerialPort) {
         print("serialPortWasRemovedFromSystem")
     }
     
     func serialPort(_ serialPort: ORSSerialPort, requestDidTimeout request: ORSSerialRequest) {
         print("requestDidTimeout")
     }
     
     func serialPort(_ serialPort: ORSSerialPort, didReceiveResponse responseData: Data, to request: ORSSerialRequest) {
         print("didReceiveResponse")
     }
     
     func serialPort(_ serialPort: ORSSerialPort, didReceivePacket packetData: Data, matching descriptor: ORSSerialPacketDescriptor) {
         print("didReceivePacket")
     }
}
