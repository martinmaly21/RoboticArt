//
//  OnboardingView.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI
 
struct OnboardingView: View {
    @State private var currentView: CurrentView = .splashScreen
    
    var body: some View {
        VStack(alignment: .center) {
            switch currentView {
            case .splashScreen:
                SplashScreen(currentView: $currentView)
            case .onboarding2:
                Text("2")
            case .onboarding3:
                Text("3")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.red, Color.purple]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}
