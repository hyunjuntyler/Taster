//
//  WaveShape.swift
//  Taster
//
//  Created by hyunjun on 10/7/24.
//

import SwiftUI

struct WaveShape: Shape {
    var amplitude: CGFloat
    var frequency: CGFloat
    var phase: CGFloat
    var waterLevel: CGFloat = 0.4
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let midHeight = rect.height * (1 - waterLevel)
        let width = rect.width
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, to: width, by: 1) {
            let y = amplitude * sin((x / width) * frequency * .pi * 2 + phase) + midHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
