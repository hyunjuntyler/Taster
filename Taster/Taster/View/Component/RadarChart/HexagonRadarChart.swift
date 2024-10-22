//
//  HexagonRadarChart.swift
//  LookSmellTaste
//
//  Created by Hyunjun Kim on 12/14/23.
//

import SwiftUI

struct HexagonRadarChart: View {
    var data: [Double]
    var valueList = ["FRUIT", "OAK", "SWEET", "SPICE", "GRAIN", "HERBAL"]
    var frame: CGFloat = 200
    
    let maxValueData: [Double] = [5, 5, 5, 5, 5, 5]
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
                        Text(valueList[0])
                    }
                    .offset(y: -frame / 1.7)
                    VStack {
                        Text(valueList[1])
                    }
                    .offset(x: -frame / 1.7, y: -frame / 4)
                    VStack {
                        Text(valueList[2])
                    }
                    .offset(x: frame / 1.6, y: -frame / 4)
                    VStack {
                        Text(valueList[3])
                    }
                    .offset(x: frame / 1.6, y: frame / 4)
                    VStack {
                        Text(valueList[4])
                    }
                    .offset(x: -frame / 1.7, y: frame / 4)
                    VStack(spacing: 0) {
                        Text(valueList[5])
                    }
                    .offset(y: frame / 1.7)
                }
                .foregroundColor(.gray)
            } else {
                Group {
                    VStack(spacing: 0) {
                        Text(valueList[0])
                    }
                    .offset(y: -frame / 1.65)
                    VStack {
                        Text(valueList[1])
                    }
                    .offset(x: -frame / 1.5, y: -frame / 4)
                    VStack {
                        Text(valueList[2])
                    }
                    .offset(x: frame / 1.5, y: -frame / 4)
                    VStack {
                        Text(valueList[3])
                    }
                    .offset(x: frame / 1.5, y: frame / 4)
                    VStack {
                        Text(valueList[4])
                    }
                    .offset(x: -frame / 1.5, y: frame / 4)
                    VStack(spacing: 0) {
                        Text(valueList[5])
                    }
                    .offset(y: frame / 1.65)
                }
                .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    HexagonRadarChart(data: [1, 2, 3, 4, 5, 1])
}
