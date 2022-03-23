//
//  CurrentView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import Foundation

enum CurrentView {
    case splashScreen
    case information
    case swipingAcrossKeyboardDemo
    case multipleKeysAtOnceDemo
    case tappableDemo
    case chooseMode
    case machineVisionMode
    case chooseSong
    case midiModePiano(song: Song)
}
