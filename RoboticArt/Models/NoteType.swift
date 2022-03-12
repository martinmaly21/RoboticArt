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
}
