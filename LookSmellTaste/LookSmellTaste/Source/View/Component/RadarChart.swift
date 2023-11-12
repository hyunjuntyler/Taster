//
//  RadarChart.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct RadarChart: View {
    var data: [Double]
    var valueList = ["바디", "알코올", "당도", "산도", "타닌"]
    var frame: CGFloat = 250
    
    let maxValueData: [Double] = [5, 5, 5, 5, 5]
    let maxValue: Double = 5
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(0..<5) { index in
                    Pentagon(data: maxValueData, maxValue: maxValue)
                        .fill(Color.appPickerGray)
                        .scaleEffect(1 - 0.2 * CGFloat(index))
                }
                
                if frame >= 150 {
                    ForEach(1..<5) {index in
                        Pentagon(data: maxValueData, maxValue: maxValue / (1 / 5 * Double(index)))
                            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                            .foregroundStyle(.appSheetBoxBackground.opacity(0.5))
                    }
                }
                
                if data != [0, 0, 0, 0, 0] {
                    ZStack {
                        Pentagon(data: data, maxValue: maxValue)
                            .foregroundStyle(.accent)
                        Pentagon(data: data, maxValue: maxValue)
                            .stroke(Color.accent, style: StrokeStyle(lineWidth: 5 * frame / 200, lineCap: .round, lineJoin: .round))
                    }
                    .scaleEffect(0.97)
                }
            }
            .frame(width: frame, height: frame)
            
            if frame >= 150 {
                Group {
                    VStack(spacing: 0) {
                        Text(valueList[0])
                    }
                    .offset(y: -frame / 1.8)
                    VStack {
                        Text(valueList[1])
                    }
                    .offset(x: -frame / 1.8, y: -frame / 5)
                    VStack {
                        Text(valueList[2])
                    }
                    .offset(x: frame / 1.9, y: -frame / 5)
                    VStack {
                        Text(valueList[3])
                    }
                    .offset(x: frame / 2.8, y: frame / 2.2)
                    VStack {
                        Text(valueList[4])
                    }
                    .offset(x: frame / -2.9, y: frame / 2.2)
                }
                .font(.gmarketSansFootnote)
                .foregroundColor(.gray)
            } else {
                Group {
                    VStack(spacing: 0) {
                        Text(valueList[0])
                    }
                    .offset(y: -frame / 1.8)
                    VStack {
                        Text(valueList[1])
                    }
                    .offset(x: -frame / 1.6, y: -frame / 5)
                    VStack {
                        Text(valueList[2])
                    }
                    .offset(x: frame / 1.7, y: -frame / 5)
                    VStack {
                        Text(valueList[3])
                    }
                    .offset(x: frame / 2.8, y: frame / 2)
                    VStack {
                        Text(valueList[4])
                    }
                    .offset(x: frame / -2.9, y: frame / 2)
                }
                .font(.gmarketSansCaption2)
                .foregroundColor(.gray)
            }
        }
    }
}

struct Pentagon: Shape {
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

#Preview {
    RadarChart(data: [1, 3, 4, 5, 2])
}
