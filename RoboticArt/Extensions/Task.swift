//
//  Task.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-21.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: TimeInterval) async {
        try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}
