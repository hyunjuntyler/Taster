//
//  PolygonChart.swift
//  Taster
//
//  Created by hyunjun on 10/22/24.
//

import SwiftUI

struct PolygonChart: View {
    let labels: [String]
    let values: [Double]
    let maxValue: Double
    let height: CGFloat
    
    var foregroundColor: Color = .accentColor
    
    private var maxValues: [Double] {
        Array(repeating: maxValue, count: values.count)
    }
    
    var body: some View {
        ZStack {
            Polygon(values: maxValues, maxValue: maxValue)
                .foregroundStyle(.ultraThinMaterial)

            Polygon(values: values, maxValue: maxValue)
                .foregroundStyle(foregroundColor)
            
            GeometryReader { geometry in
                let positions = labelPositions(in: geometry.frame(in: .local))
                
                ForEach(Array(zip(labels, positions)), id: \.0) { label, position in
                    Text(label)
                        .font(.caption)
                        .position(position)
                }
            }
        }
        .frame(height: height)
        .frame(height: height * 1.6)
    }
    
    private func labelPositions(in rect: CGRect) -> [CGPoint] {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2 * 1.3
        let segmentAngle = 2 * .pi / Double(maxValues.count)
        
        return values.enumerated().map { (index, _) in
            let angle = segmentAngle * Double(index) - .pi / 2
            let radius = radius * CGFloat(maxValues[index] / maxValue)
            return CGPoint(
                x: center.x + radius * CGFloat(cos(angle)),
                y: center.y + radius * CGFloat(sin(angle))
            )
        }
    }
}

#Preview {
    PolygonChart(labels: ["라벨 1", "라벨 2", "라벨 3", "라벨 4", "라벨 5", "라벨 6"], values: [5, 4, 3, 2, 1], maxValue: 5, height: 120)
}
