//
//  CocktailView.swift
//  Taster
//
//  Created by hyunjun on 10/7/24.
//

import SwiftUI

struct CocktailView: View {
    @State private var phase1: CGFloat = 0
    @State private var phase2: CGFloat = .pi / 3
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                GlassShape()
                    .frame(width: 60, height: 90)
                    .foregroundStyle(.appGlass)
                ZStack {
                    WaveShape(amplitude: 3, frequency: 1, phase: phase1)
                        .frame(width: 48, height: 53)
                        .foregroundStyle(.rubyWine)
                    WaveShape(amplitude: 3, frequency: 1, phase: phase2)
                        .frame(width: 48, height: 53)
                        .foregroundStyle(.rubyWine.opacity(0.7))
                }
                .clipShape(LiquidShape())
            }
            .onAppear {
                withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                    phase1 += .pi * 2
                    phase2 += .pi * 4
                }
            }
        }
    }
    
    struct GlassShape: Shape {
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

    struct LiquidShape: Shape {
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

}

#Preview {
    CocktailView()
}
