//
//  Wine.swift
//  Taster
//
//  Created by hyunjun on 10/7/24.
//

import SwiftUI

enum Wine {
    struct GlassShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.17055*width, y: 0.00442*height))
            path.addLine(to: CGPoint(x: 0.4952*width, y: 0.00442*height))
            path.addLine(to: CGPoint(x: 0.49575*width, y: 0.00442*height))
            path.addLine(to: CGPoint(x: 0.8204*width, y: 0.00442*height))
            path.addCurve(to: CGPoint(x: 0.98915*width, y: 0.34193*height), control1: CGPoint(x: 0.93819*width, y: 0.11567*height), control2: CGPoint(x: 0.97617*width, y: 0.19094*height))
            path.addCurve(to: CGPoint(x: 0.5478*width, y: 0.73272*height), control1: CGPoint(x: 1.00213*width, y: 0.49291*height), control2: CGPoint(x: 0.87957*width, y: 0.63813*height))
            path.addLine(to: CGPoint(x: 0.5478*width, y: 0.91035*height))
            path.addCurve(to: CGPoint(x: 0.76848*width, y: 0.97252*height), control1: CGPoint(x: 0.65672*width, y: 0.92906*height), control2: CGPoint(x: 0.70656*width, y: 0.94214*height))
            path.addCurve(to: CGPoint(x: 0.76848*width, y: 0.99917*height), control1: CGPoint(x: 0.83039*width, y: 1.00291*height), control2: CGPoint(x: 0.76848*width, y: 0.99917*height))
            path.addLine(to: CGPoint(x: 0.49575*width, y: 0.99917*height))
            path.addLine(to: CGPoint(x: 0.4952*width, y: 0.99917*height))
            path.addLine(to: CGPoint(x: 0.22247*width, y: 0.99917*height))
            path.addCurve(to: CGPoint(x: 0.22247*width, y: 0.97252*height), control1: CGPoint(x: 0.22247*width, y: 0.99917*height), control2: CGPoint(x: 0.16056*width, y: 1.00291*height))
            path.addCurve(to: CGPoint(x: 0.44315*width, y: 0.91035*height), control1: CGPoint(x: 0.28438*width, y: 0.94214*height), control2: CGPoint(x: 0.33422*width, y: 0.92906*height))
            path.addLine(to: CGPoint(x: 0.44315*width, y: 0.73272*height))
            path.addCurve(to: CGPoint(x: 0.0018*width, y: 0.34193*height), control1: CGPoint(x: 0.11138*width, y: 0.63813*height), control2: CGPoint(x: -0.01119*width, y: 0.49291*height))
            path.addCurve(to: CGPoint(x: 0.17055*width, y: 0.00442*height), control1: CGPoint(x: 0.01478*width, y: 0.19094*height), control2: CGPoint(x: 0.05276*width, y: 0.11567*height))
            path.closeSubpath()
            return path
        }
    }
    
    struct LiquidShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.22118*width, y: 0.00656*height))
            path.addLine(to: CGPoint(x: 0.50101*width, y: 0.00656*height))
            path.addLine(to: CGPoint(x: 0.50227*width, y: 0.00656*height))
            path.addLine(to: CGPoint(x: 0.7821*width, y: 0.00656*height))
            path.addCurve(to: CGPoint(x: 0.98739*width, y: 0.53919*height), control1: CGPoint(x: 0.9052*width, y: 0.16946*height), control2: CGPoint(x: 0.98739*width, y: 0.30303*height))
            path.addCurve(to: CGPoint(x: 0.50227*width, y: 0.98938*height), control1: CGPoint(x: 0.98739*width, y: 0.77411*height), control2: CGPoint(x: 0.72429*width, y: 0.98716*height))
            path.addLine(to: CGPoint(x: 0.50227*width, y: 0.98939*height))
            path.addCurve(to: CGPoint(x: 0.50164*width, y: 0.98939*height), control1: CGPoint(x: 0.50206*width, y: 0.98939*height), control2: CGPoint(x: 0.50185*width, y: 0.98939*height))
            path.addCurve(to: CGPoint(x: 0.50101*width, y: 0.98939*height), control1: CGPoint(x: 0.50143*width, y: 0.98939*height), control2: CGPoint(x: 0.50122*width, y: 0.98939*height))
            path.addLine(to: CGPoint(x: 0.50101*width, y: 0.98938*height))
            path.addCurve(to: CGPoint(x: 0.01589*width, y: 0.53919*height), control1: CGPoint(x: 0.27899*width, y: 0.98716*height), control2: CGPoint(x: 0.01589*width, y: 0.77411*height))
            path.addCurve(to: CGPoint(x: 0.22118*width, y: 0.00656*height), control1: CGPoint(x: 0.01589*width, y: 0.30303*height), control2: CGPoint(x: 0.09808*width, y: 0.16946*height))
            path.closeSubpath()
            return path
        }
    }
}
