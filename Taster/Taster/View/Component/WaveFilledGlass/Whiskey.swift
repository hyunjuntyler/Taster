//
//  Whiskey.swift
//  Taster
//
//  Created by Hyunjun Kim on 10/14/24.
//

import SwiftUI

enum Whiskey {
    struct GlassShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.17527*width, y: 0.01535*height))
            path.addCurve(to: CGPoint(x: 0.07448*width, y: 0.4117*height), control1: CGPoint(x: 0.22047*width, y: 0.20653*height), control2: CGPoint(x: 0.14839*width, y: 0.34494*height))
            path.addCurve(to: CGPoint(x: 0.08924*width, y: 0.6658*height), control1: CGPoint(x: 0.00057*width, y: 0.47846*height), control2: CGPoint(x: 0.0032*width, y: 0.57955*height))
            path.addCurve(to: CGPoint(x: 0.26149*width, y: 0.75854*height), control1: CGPoint(x: 0.13475*width, y: 0.71141*height), control2: CGPoint(x: 0.20521*width, y: 0.73761*height))
            path.addCurve(to: CGPoint(x: 0.35048*width, y: 0.81189*height), control1: CGPoint(x: 0.3116*width, y: 0.77717*height), control2: CGPoint(x: 0.35048*width, y: 0.79163*height))
            path.addCurve(to: CGPoint(x: 0.28035*width, y: 0.88952*height), control1: CGPoint(x: 0.35048*width, y: 0.85491*height), control2: CGPoint(x: 0.33514*width, y: 0.87047*height))
            path.addCurve(to: CGPoint(x: 0.17527*width, y: 0.9837*height), control1: CGPoint(x: 0.19401*width, y: 0.91952*height), control2: CGPoint(x: 0.18215*width, y: 0.93275*height))
            path.addLine(to: CGPoint(x: 0.41091*width, y: 0.9837*height))
            path.addCurve(to: CGPoint(x: 0.46699*width, y: 0.98431*height), control1: CGPoint(x: 0.44431*width, y: 0.98394*height), control2: CGPoint(x: 0.46036*width, y: 0.98415*height))
            path.addCurve(to: CGPoint(x: 0.50476*width, y: 0.98383*height), control1: CGPoint(x: 0.47422*width, y: 0.98419*height), control2: CGPoint(x: 0.48611*width, y: 0.98403*height))
            path.addCurve(to: CGPoint(x: 0.54253*width, y: 0.98431*height), control1: CGPoint(x: 0.52341*width, y: 0.98403*height), control2: CGPoint(x: 0.5353*width, y: 0.98419*height))
            path.addCurve(to: CGPoint(x: 0.59861*width, y: 0.9837*height), control1: CGPoint(x: 0.54916*width, y: 0.98415*height), control2: CGPoint(x: 0.56522*width, y: 0.98394*height))
            path.addLine(to: CGPoint(x: 0.83425*width, y: 0.9837*height))
            path.addCurve(to: CGPoint(x: 0.72917*width, y: 0.88952*height), control1: CGPoint(x: 0.82737*width, y: 0.93275*height), control2: CGPoint(x: 0.81551*width, y: 0.91952*height))
            path.addCurve(to: CGPoint(x: 0.65985*width, y: 0.81581*height), control1: CGPoint(x: 0.67438*width, y: 0.87047*height), control2: CGPoint(x: 0.65985*width, y: 0.84447*height))
            path.addCurve(to: CGPoint(x: 0.73526*width, y: 0.77056*height), control1: CGPoint(x: 0.65985*width, y: 0.80198*height), control2: CGPoint(x: 0.69213*width, y: 0.78853*height))
            path.addCurve(to: CGPoint(x: 0.88486*width, y: 0.69119*height), control1: CGPoint(x: 0.78147*width, y: 0.7513*height), control2: CGPoint(x: 0.84014*width, y: 0.72686*height))
            path.addCurve(to: CGPoint(x: 0.95357*width, y: 0.43957*height), control1: CGPoint(x: 0.97129*width, y: 0.62226*height), control2: CGPoint(x: 1.00601*width, y: 0.51126*height))
            path.addCurve(to: CGPoint(x: 0.83425*width, y: 0.01535*height), control1: CGPoint(x: 0.90112*width, y: 0.36789*height), control2: CGPoint(x: 0.78906*width, y: 0.20653*height))
            path.addLine(to: CGPoint(x: 0.51713*width, y: 0.01535*height))
            path.addLine(to: CGPoint(x: 0.49239*width, y: 0.01535*height))
            path.addLine(to: CGPoint(x: 0.17527*width, y: 0.01535*height))
            path.closeSubpath()
            return path
        }
    }
    
    struct LiquidShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.96875*width, y: 0.69565*height))
            path.addCurve(to: CGPoint(x: 0.5*width, y: height), control1: CGPoint(x: 0.96875*width, y: 0.86957*height), control2: CGPoint(x: 0.7504*width, y: height))
            path.addCurve(to: CGPoint(x: 0.03125*width, y: 0.69565*height), control1: CGPoint(x: 0.2496*width, y: height), control2: CGPoint(x: 0.0625*width, y: 0.91304*height))
            path.addCurve(to: CGPoint(x: 0.21875*width, y: 0.02174*height), control1: CGPoint(x: 0.03125*width, y: 0.52174*height), control2: CGPoint(x: 0.25*width, y: 0.47826*height))
            path.addLine(to: CGPoint(x: 0.78125*width, y: 0.02174*height))
            path.addCurve(to: CGPoint(x: 0.96875*width, y: 0.69565*height), control1: CGPoint(x: 0.78125*width, y: 0.47826*height), control2: CGPoint(x: width, y: 0.56522*height))
            path.closeSubpath()
            return path
        }
    }
}
