//
//  CirclePulseButton.swift
//  RoboticArt
//
//  Created by Martin Maly on 2022-03-12.
//

import SwiftUI


//
//  PJRPulseButton.swift
//  PulseAnimation
//
//  Created by Paritosh Raval on 22/03/21.
//
/*
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the <organization> nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

import SwiftUI

// MARK: - Strucutre for Circle
struct CircleData: Hashable {
    let width: CGFloat
    let opacity: Double
}

struct CirclePulseButton: View {
    
    // MARK: - Properties
    @State private var isAnimating: Bool = false
    var color: Color
    var text: String
    var buttonDimension: CGFloat
    var numberOfOuterCircles: Int
    var animationDuration: Double
    var circleArray = [CircleData]()


    init(color: Color = Color.blue, text: String, buttonDimension: CGFloat = 48, numberOfOuterCircles: Int = 2, animationDuration: Double  = 1) {
        self.color = color
        self.text = text
        self.buttonDimension = buttonDimension
        self.numberOfOuterCircles = numberOfOuterCircles
        self.animationDuration = animationDuration
        
        var circleWidth = self.buttonDimension
        var opacity = (numberOfOuterCircles > 4) ? 0.40 : 0.20
        
        for _ in 0..<numberOfOuterCircles{
            circleWidth += 20
            self.circleArray.append(CircleData(width: circleWidth, opacity: opacity))
            opacity -= 0.05
        }
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            Group {
                ForEach(circleArray, id: \.self) { circle in
                    Circle()
                            .fill(self.color)
                            .opacity(self.isAnimating ? circle.opacity : 0.3)
                        .frame(width: circle.width, height: circle.width, alignment: .center)
                        .scaleEffect(self.isAnimating ? 1 : 0.5)
                }
                
            }
            .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true),
               value: self.isAnimating)

            Text(text)
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.white)
                .background(Color.clear)
            .onAppear(perform: {
                self.isAnimating.toggle()
            })
        } //: ZSTACK
    }

}
