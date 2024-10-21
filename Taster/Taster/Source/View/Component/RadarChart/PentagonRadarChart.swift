//
//  RadarChart.swift
//  LookSmellTaste
//
//  Created by hyunjun on 11/12/23.
//

import SwiftUI

struct PentagonRadarChart: View {
    var data: [Double]
    var valueList = ["바디", "알코올", "당도", "산도", "타닌"]
    var frame: CGFloat = 200
    
    let maxValueData: [Double] = [5, 5, 5, 5, 5]
    let maxValue: Double = 5
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(0..<5) { index in
                    PolygonChart(data: maxValueData, maxValue: maxValue)
                        .fill(Color.appPickerGray)
                        .scaleEffect(1 - 0.2 * CGFloat(index))
                }
                
                if frame >= 150 {
                    ForEach(1..<5) {index in
                        PolygonChart(data: maxValueData, maxValue: maxValue / (1 / 5 * Double(index)))
                            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                            .foregroundStyle(.appSheetBoxBackground.opacity(0.5))
                    }
                }
                
                if data != [0, 0, 0, 0, 0] {
                    ZStack {
                        PolygonChart(data: data, maxValue: maxValue)
                            .foregroundStyle(.accent)
                        PolygonChart(data: data, maxValue: maxValue)
                            .stroke(Color.accent, style: StrokeStyle(lineWidth: 5 * frame / 200, lineCap: .round, lineJoin: .round))
                    }
                    .scaleEffect(0.97)
                }
            }
            .frame(width: frame, height: frame)
            
            if frame >= 150 {
                Group {
                    VStack(spacing: 0) {
                        Text(LocalizedStringKey(valueList[0]))
                    }
                    .offset(y: -frame / 1.8)
                    VStack {
                        Text(LocalizedStringKey(valueList[1]))
                    }
                    .offset(x: -frame / 1.8, y: -frame / 5)
                    VStack {
                        Text(LocalizedStringKey(valueList[2]))
                    }
                    .offset(x: frame / 1.9, y: -frame / 5)
                    VStack {
                        Text(LocalizedStringKey(valueList[3]))
                    }
                    .offset(x: frame / 2.8, y: frame / 2.2)
                    VStack {
                        Text(LocalizedStringKey(valueList[4]))
                    }
                    .offset(x: frame / -2.9, y: frame / 2.2)
                }
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
                .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    PentagonRadarChart(data: [1, 3, 4, 5, 2])
}
