//
//  WaveFilledGlassShape.swift
//  Taster
//
//  Created by hyunjun on 10/22/24.
//

import SwiftUI

struct Wave: Shape {
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

struct WineGlass: Shape {
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

struct WineLiquid: Shape {
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

struct WhiskeyGlass: Shape {
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

struct WhiskeyLiquid: Shape {
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

struct CocktailGlass: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.08684*width, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: 0.33305*height), control1: CGPoint(x: 0.02666*width, y: 0.12859*height), control2: CGPoint(x: 0, y: 0.17204*height))
        path.addCurve(to: CGPoint(x: 0.44218*width, y: 0.67145*height), control1: CGPoint(x: 0.01233*width, y: 0.48723*height), control2: CGPoint(x: 0.10979*width, y: 0.57811*height))
        path.addLine(to: CGPoint(x: 0.44218*width, y: 0.89398*height))
        path.addCurve(to: CGPoint(x: 0.22109*width, y: 0.95533*height), control1: CGPoint(x: 0.33306*width, y: 0.91244*height), control2: CGPoint(x: 0.28312*width, y: 0.92535*height))
        path.addCurve(to: CGPoint(x: 0.22109*width, y: 0.98163*height), control1: CGPoint(x: 0.15906*width, y: 0.98532*height), control2: CGPoint(x: 0.22109*width, y: 0.98163*height))
        path.addLine(to: CGPoint(x: 0.76641*width, y: 0.98163*height))
        path.addCurve(to: CGPoint(x: 0.76641*width, y: 0.95533*height), control1: CGPoint(x: 0.76641*width, y: 0.98163*height), control2: CGPoint(x: 0.82843*width, y: 0.98532*height))
        path.addCurve(to: CGPoint(x: 0.54531*width, y: 0.89398*height), control1: CGPoint(x: 0.70438*width, y: 0.92535*height), control2: CGPoint(x: 0.65444*width, y: 0.91244*height))
        path.addLine(to: CGPoint(x: 0.54531*width, y: 0.67145*height))
        path.addCurve(to: CGPoint(x: 0.9875*width, y: 0.33305*height), control1: CGPoint(x: 0.87446*width, y: 0.59576*height), control2: CGPoint(x: 0.9875*width, y: 0.47085*height))
        path.addCurve(to: CGPoint(x: 0.89922*width, y: 0), control1: CGPoint(x: 0.9875*width, y: 0.19526*height), control2: CGPoint(x: 0.96215*width, y: 0.14405*height))
        path.addLine(to: CGPoint(x: 0.08684*width, y: 0))
        path.closeSubpath()
        return path
    }
}

struct CocktailLiquid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.01602*width, y: 0.56258*height))
        path.addCurve(to: CGPoint(x: 0.11615*width, y: 0.02856*height), control1: CGPoint(x: -0.01264*width, y: 0.32066*height), control2: CGPoint(x: 0.11615*width, y: 0.02856*height))
        path.addLine(to: CGPoint(x: 0.89003*width, y: 0.02856*height))
        path.addCurve(to: CGPoint(x: 0.98562*width, y: 0.56258*height), control1: CGPoint(x: 0.89003*width, y: 0.02856*height), control2: CGPoint(x: 1.00655*width, y: 0.3003*height))
        path.addCurve(to: CGPoint(x: 0.48999*width, y: 0.99489*height), control1: CGPoint(x: 0.9647*width, y: 0.82486*height), control2: CGPoint(x: 0.76716*width, y: 0.99489*height))
        path.addCurve(to: CGPoint(x: 0.01602*width, y: 0.56258*height), control1: CGPoint(x: 0.24345*width, y: 0.99489*height), control2: CGPoint(x: 0.04467*width, y: 0.8045*height))
        path.closeSubpath()
        return path
    }
}
