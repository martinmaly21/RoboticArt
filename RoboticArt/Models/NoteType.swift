//
//  NoteType.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import Foundation

enum NoteType: String, CaseIterable {
    case c1
    case d1
    case e1
    case f1
    case g1
    case a1
    case b1
    case c2
    
    case c3
    case d2
    case e2
    case f2
    case g2
    case a2
    case b2
    case c4
    
    var parsedNote: String {
        switch self {
        case .c1, .c2, .c3, .c4:
            return "C"
        case .d1, .d2:
            return "D"
        case .e1, .e2:
            return "E"
        case .f1, .f2:
            return "F"
        case .g1, .g2:
            return "G"
        case .a1, .a2:
            return "A"
        case .b1, .b2:
            return "B"
        }
    }
    
    var binaryNote: String {
        switch self {
        case .c1:
            return "1000000000000000"
        case .d1:
            return "0100000000000000"
        case .e1:
            return "0010000000000000"
        case .f1:
            return "0001000000000000"
        case .g1:
            return "0000100000000000"
        case .a1:
            return "0000010000000000"
        case .b1:
            return "0000001000000000"
        case .c2:
            return "0000000100000000"
        case .c3:
            return "0000000010000000"
        case .d2:
            return "0000000001000000"
        case .e2:
            return "0000000000100000"
        case .f2:
            return "0000000000010000"
        case .g2:
            return "0000000000001000"
        case .a2:
            return "0000000000000100"
        case .b2:
            return "0000000000000010"
        case .c4:
            return "0000000000000001"
        }
    }
}
