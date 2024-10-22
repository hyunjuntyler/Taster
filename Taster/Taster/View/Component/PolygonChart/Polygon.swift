//
//  Polygon.swift
//  Taster
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct Polygon: Shape {
    let values: [Double]
    let maxValue: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
    
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        
        let segmentAngle = 2 * .pi / Double(values.count)
        
        for (index, value) in values.enumerated() {
            let angle = segmentAngle * Double(index) - .pi / 2
            let radius = radius * CGFloat(value / maxValue)
            
            let point = CGPoint(
                x: center.x + radius * CGFloat(cos(angle)),
                y: center.y + radius * CGFloat(sin(angle))
            )
            
            if index == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        path.closeSubpath()

        return path
    }
}
