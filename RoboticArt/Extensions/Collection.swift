//
//  Collection.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-24.
//

import Foundation


extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
