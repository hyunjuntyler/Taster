//
//  PolygonChart.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct PolygonChart: Shape {
    let data: [Double]
    let maxValue: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        
        let segmentAngle = 2 * .pi / Double(data.count)
        
        for (index, value) in data.enumerated() {
            let angle = segmentAngle * Double(index) - .pi / 2
            let valueRadius = radius * CGFloat(value / maxValue)
            
            let point = CGPoint(
                x: center.x + valueRadius * CGFloat(cos(angle)),
                y: center.y + valueRadius * CGFloat(sin(angle))
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
