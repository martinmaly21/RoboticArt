//
//  String.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-22.
//

import Foundation


extension String {
    func pad(toSize: Int) -> String {
        var padded = self
        for _ in 0..<(toSize - self.count) {
            padded = "0" + padded
        }
        return padded
    }
}
