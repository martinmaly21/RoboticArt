//
//  CGPoint.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-23.
//

import Foundation

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.x)
    }
}
